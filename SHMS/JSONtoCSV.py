import json
import datetime
import math
import statistics

"""
 Detta hack städar data och genererar CSV filer
 skriven av Olof Sjödin, senast ändrad 2016-02-22
"""

def standardDeviation(listOfNumb):
    """
    Beräknar standardavvikelsen av en lista av tal.
    """

    mu = statistics.mean(listOfNumb)

    z = 0
    for i in listOfNumb:
        z += (i-mu)*(i-mu)

    return math.sqrt(z/len(listOfNumb))

def getAllPricesFromJSON(jsonfile):
    """
    Denna metod hämtar alla priser från en JSON fil och sorterar dem efter
    stadsdel. Returnerar som en dictionary.
    """
    saved = []
    with open(jsonfile) as data_file:
        data = json.load(data_file)
        totalQ = len(data)
        print("Antalet från början:" + str(totalQ))
        dublettKoll = []
        NrInList = 0
        for annons in data:
            if "objectType" in annons:
                if (annons['objectType'] == "Lägenhet" and "soldPrice" in
                        annons and "livingArea" in annons):
                    if not annons['booliId'] in dublettKoll:
                        soldPrice = annons['soldPrice']
                        livingArea = annons['livingArea']
                        if livingArea == 0:
                            print("Skipping " + str(annons['booliId']))
                        else:
                            NrInList += 1
                            saved.append(soldPrice/livingArea)
                            dublettKoll.append(annons['booliId'])
        print("Antalet nu:" + str(NrInList))
        return saved

def getNhoodsFromJSON(jsonfile):
    print("Tvättar datan")
    saved = {}
    with open(jsonfile) as data_file:

        ## Samlar upp alla stadsdelar och sorterar varje data i respektive stadsdel
        data = json.load(data_file)
        totalQ = len(data)
        print("Antalet från början:" + str(totalQ))
        dublettKoll = []
        NrInList = 0
        for annons in data:

            if "objectType" in annons:
                if (annons['objectType'] == "Lägenhet" and "namedAreas" in
                annons['location'] and "listPrice" in annons and "soldPrice" in annons
                and "soldDate" in annons and "livingArea" in annons):
                    if not annons['booliId'] in dublettKoll:
                        listPrice = annons['listPrice']
                        soldPrice = annons['soldPrice']
                        location = annons['location']['namedAreas'][0]
                        soldDate = annons['soldDate']
                        livingArea = annons['livingArea']
                        if livingArea == 0 or listPrice == 0:
                            print("Skipping " + str(annons['booliId']))
                        else:
                            NrInList += 1
                            if not (location in saved):
                                saved[location] = []
                                saved[location].append((soldPrice/livingArea, (soldPrice/listPrice-1)*100, soldDate, annons['booliId']))
                            else:
                                saved[location].append((soldPrice/livingArea, (soldPrice/listPrice-1)*100, soldDate, annons['booliId']))

                            dublettKoll.append(annons['booliId'])
        print("Antalet nu:" + str(NrInList))
        return saved

def filterStatistics(saved, dateFrom, dateTo):
    print(saved)
    if dateFrom >= dateTo:
        print(str(dateFrom) + ">" + str(dateTo) + " är tydligen inte sant!")
        exit()

    newSaved = {}
    for key, data in saved.items():
        for saleData in data:

            soldDate = saleData[2]
            tmp = soldDate.split('-')
            soldDate = datetime.date(int(tmp[0]), int(tmp[1]), int(tmp[2]))

            # Lägg till bara om datumen är mellan dateFrom och dateTo
            # datetime.date(2015,1,12) > datetime.date(2015,1,11)
            if dateTo >= soldDate and dateFrom <= soldDate:
                if not (key in newSaved):
                    newSaved[key] = []
                newSaved[key].append(saleData)
    return newSaved

def genMxFromDict(saved):
    ## Denna kollar igenom varje stadsdel och tar medelvärdet, beräknar även
    ## den äldsta/nyaste säljstatistiken

    print("Genererar matris")

    matrix = [['Stadsdel','Medelvärde','Medelpris/m^2','Äldst','Yngst','Frekvens','Standardavvikelse']]
    total = 0

    for key, data in saved.items():
        PERCENTSUM = 0         # Används för att beräkna medelvärdet av andelarna
        MEANPRICEPERAREACUM = 0
        i = 0         # totalt jävla onödigt egentligen?
        oldest = newest = None

        tempList=[]     # Används för att beräkna standardavvikelsen

        for saleData in data:

            ## datetime hack
            soldDate = saleData[2]
            tmp = soldDate.split('-')
            soldDate = datetime.date(int(tmp[0]), int(tmp[1]), int(tmp[2]))

            ## add it
            tempList.append(saleData[0])

            meanPricePerArea = saleData[0]
            MEANPRICEPERAREACUM += meanPricePerArea
            percent = saleData[1]

            ## accumulate
            PERCENTSUM += percent
            i += 1

            ## hack
            if oldest == None:
                oldest = soldDate

            if newest == None:
                newest = soldDate

            ## compare dates
            if soldDate < oldest:
                oldest = soldDate
            elif soldDate > newest:
                newest = soldDate


        # done
        if i > 1:
            mean = PERCENTSUM/i
            total += i
            matrix.append([key, mean, MEANPRICEPERAREACUM/i, oldest, newest,i,standardDeviation(tempList)])
    return matrix

def wToCSVbyList(filen, listnr):
    print("Genererar CSV")
    with open(filen, 'w') as out:
        for i in listnr:
            out.write(str(i) + '\n')


def wToCSVbyAll(csvfile, saved):
    with open(csvfile, 'w') as out:
        for key, data in saved.items():
            for dataT in data:
                out.write(str(dataT[0]) + '\n')

def mergeData(nbr1, nbr2):
    print("Mergar datan")
    saved = {}
    usedKeys = []
    for key, data in nbr1.items():

        usedKeys.append(data[0][3])
        if not (key in saved):
            saved[key] = data
        else:
            saved[key].append(data[0])
    for key, data in nbr2.items():
        if not (data[0][3] in usedKeys):
            usedKeys.append(data[0][3])
            if not (key in saved):
                saved[key] = data
            else:
                saved[key].append(data[0])

    return saved

def getAllPricesFromNbr(nbr):
    print("Genererar lista")
    res = []
    for key, data in nbr.items():
        for subdata in data:
            res.append(subdata[0])
    return res


def main():
    # TODO: Allt det här är extremt mycket lättare att göra i Pandas..
    print("JSONtoCSV.py")

    dataloc = "../data/"

    # Exempel
    nbr = [getNhoodsFromJSON(dataloc + "booli-såld-innerstaden.json")
           ,getNhoodsFromJSON(dataloc + "booli-såld-Stockholm.json")
           ,getNhoodsFromJSON(dataloc + "booli-stockholm-sold-birger.json")
           ,getNhoodsFromJSON(dataloc + "booli-såld-Östermalm.json")]

    # Exempel på filtrering
    newNbr = []
    for n in nbr:
        newNbr.append(filterStatistics(n, datetime.date(2015,1,1), datetime.date.today()))

    # Skriver till CSV filer
    wToCSVbyList('../data/innerstaden-1year.csv', getAllPricesFromNbr(newNbr[0]))
    wToCSVbyList('../data/Sthlm-1year.csv', getAllPricesFromNbr(newNbr[1]))
    wToCSVbyList('../data/Birger-1year.csv', getAllPricesFromNbr(newNbr[2]))
    wToCSVbyList('../data/Östermalm-1year.csv', getAllPricesFromNbr(newNbr[3]))

    print("done")

main()
