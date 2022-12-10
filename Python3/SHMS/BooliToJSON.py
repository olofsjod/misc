"""
BooliToJSON
Skriven av Olof Sjödin, senast ändrad 2016-06-13

Pythonhack som utnyttjar Boolis API för att generera en JSON objekt med
bostadsdata.

Licenserad med 'MIT Licence'. Se bilagan 'LICENCE' för mer information vad det
innebär.
"""

# "Always code as if the guy who ends up maintaining your code will be a violent
# psychopath who knows where you live."

from hashlib import sha1

import urllib.request
import urllib.parse
import time
import random
import string
import json

def getSoldJSONFromBooli(inp):
    # döper om indata..
    userAgent = inp['user_agent']
    callerId = inp['caller_id']
    privateKey = inp['private_key']
    query = inp['query']

    offset = inp['offset']
    limit = inp['limit']

    # genererar en hashad sträng
    timestamp = str(int(time.time()))
    unique = ''.join(random.choice(string.ascii_lowercase + string.digits) for x in range(16))
    toHash = callerId + timestamp + privateKey + unique
    hashstr = sha1(toHash.encode('utf-8')).hexdigest()

    # gör söksträngen mer servervänlig
    query = urllib.parse.quote(query)
    
    # lägger till UA och hämtar JSON objektet
    opener = urllib.request.build_opener()
    opener.addheaders = [('User-agent', userAgent)]

    url = "http://api.booli.se/sold?q=%s&callerId=%s&time=%s&unique=%s&hash=%s&limit=%d&offset=%d" % (query, callerId, timestamp, unique, hashstr, limit, offset)

    resp = opener.open(url)
    data = resp.read()

    # Behandlar rådata till 'python json'
    ret = json.loads(data.decode('utf-8'))
    return ret

def getSoldObjects(inp):
    userAgent = inp['user_agent']
    callerId = inp['caller_id']
    privateKey = inp['private_key']
    query = inp['query']

    # HACK

    # OK, nu vill vi iterera igenom alla resultat från booli.
    # För att inte skämma ut oss, så bör vi kontrollera att den gör det den ska
    # först.

    offsetNow = 0
    limit = 500

    paramsToFunc = inp.copy()
    paramsToFunc['offset'] = offsetNow
    paramsToFunc['limit'] = limit

    json = getSoldJSONFromBooli(paramsToFunc)
    numSent = json['count']

    if numSent == 0:
        print("Inga resultat.")
        return []

    print( str(json['totalCount']) + " från " + query + " kommer att sparas" )

    # TODO: Kontrollera om det är möjligt att få ut annat än sålda bostäder...
    ret = json['sold']

    while (offsetNow + numSent + 1) < json['totalCount']:
        if (offsetNow + limit + numSent + 1) > json['totalCount']:
            print(str(json['totalCount']) + " av "+  str(json['totalCount']))
        else:
            print(str(offsetNow + limit) + " av " + str(json['totalCount']))

        paramsToFunc['offset'] = offsetNow + numSent + 1
        json = getSoldJSONFromBooli(paramsToFunc)

        ret.extend(json['sold'])
        offsetNow += limit

        time.sleep(0.5)

    return ret 

def retrievePrivateKey(filepath):
    # TODO: Kontroll om denna existerar?
    with open(filepath, 'r') as infile:
        ret = infile.read().strip('\n')
        return ret

def makeStringValid(string):
    # UGLY

    ret = ""
    for s in string:
        if s == " ":
            ret += "-"
        else:
            ret += s
    return ret

def search(query):
    import os.path
    if os.path.isfile("booli-cache-" + query + ".json"):
        with open("booli-cache-" + query + ".json") as data_file:
            return json.load(data_file)
    else:
        privKey = retrievePrivateKey('BooliAPIKey')
        searchParam = {'user_agent' : 'Blubb/1.0',
                'caller_id' : 'Blubb',
                'private_key' : privKey,
                'query' : query }
        ret = getSoldObjects(searchParam)

        filename = "booli-cache-" + query + ".json"
        with open(filename, 'w') as outfile:
            json.dump(ret, outfile)

        return ret

def main():
    print("Skriv in din söksträng (ex: Stockholms Län):")
    query = ""
    while query == "":
        query = input().strip('\n')
        if query == "":
            print("Du måste skriva in någonting. Försök igen.")

    fileQuery = makeStringValid(query)
    filename = "booli-såld-" + fileQuery + ".json"

    print("OK. Allt data kommer att sparas till %s" % filename)
    
    privKey = retrievePrivateKey('BooliAPIKey')
    searchParam = {'user_agent' : 'Blubb/1.0',
            'caller_id' : 'Blubb',
            'private_key' : privKey,
            'query' : query }

    soldobjects = getSoldObjects(searchParam)

    with open(filename, 'w') as outfile:
        json.dump(soldobjects, outfile)

if __name__ == "__main__":
    main()
