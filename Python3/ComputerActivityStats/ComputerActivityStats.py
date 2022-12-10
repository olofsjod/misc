#!/usr/bin/python3

"""
ComputerActivityStats
ihopsnickrad av Olof Sjödin

Program that generate charts on how much you use the computer.
"""

from subprocess import Popen, PIPE
from time import sleep, time

def GetMouseActivity():
    # HACK :)
    tmp = Popen(["xdotool","getmouselocation","--shell"], stdout=PIPE)
    out = tmp.communicate()
    out = out[0]
    out = out.decode("utf-8")
    # borde typ ge något X=...\nY=...\n...

    tmp = out.split("\n")

    x = int(tmp[0][2:])
    y = int(tmp[1][2:])

    return (x,y)

def MeasureActivity():
    pos = []
    timepos = []
    lastpos = (0,0)
    starttime = time()
    try:
        while True:
            sleep(1)
            tmp = GetMouseActivity()
            if tmp != lastpos:
                t = time()-starttime
                print(tmp, t)
                pos.append(tmp)
                timepos.append(t)
                lastpos = tmp
    except:
        print("stop... hammertime")

    endtime = time()

    return (pos, timepos, starttime, endtime)

def SaveToCSV(csvfile, tpl): 
    pos, timepos, starttime, endtime = tpl
    with open(csvfile, 'w') as out:
        out.write('START TIME: ' + str(starttime) + '\n')
        out.write('END TIME: ' + str(endtime) + '\n')
        out.write('\nt;x;y\n')

        for i in range(len(pos)):
            out.write(str(timepos[i]) + ',' + str(pos[i][0]) + ',' +
                    str(pos[i][1]) + '\n')
def PlotHeatmap(act):
    import matplotlib.pyplot as plt
    import numpy as np

    pos, timepos, starttime, endtime = act

    x_values = []
    y_values = []

    for x, y in pos:
        x_values.append(x)
        y_values.append(y)


    heatmap, xedges, yedges = np.histogram2d(x_values, y_values, bins=50)
    extent = [xedges[0], xedges[-1], yedges[0], yedges[-1]]

    plt.clf()
    plt.imshow(heatmap, extent=extent)
    plt.show()
    

def main():
    q = MeasureActivity()
    SaveToCSV('mousedata.csv', q)
    
main()
