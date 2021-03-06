#!/bin/python
import math
import csv
import sys
import statistics

def evaluate(trueFront, front):
    #front = data["front"]
    #trueFront = data["trueFront"]
    igd = 0
    for item in trueFront:
        igd = igd + math.sqrt(minimumEdistance(item, front))
    return igd/len(trueFront)

def minimumEdistance(item, front):
    result = []
    for instance in front:
        result.append(distance(instance, item))
    return min(result)

def distance(instance, item):
    value = (float(instance[0]) - float(item[0]))**2 + (float(instance[1]) - float(item[1]))**2
    return value

def readCSV(addr):
    with open(addr, newline='') as csvfile:
        data = list(csv.reader(csvfile, delimiter=','))
    return data

if __name__ == '__main__':
    #trueFrontAddr = (sys.argv)[1]
    #trueFront = readCSV(trueFrontAddr)
    #print(trueFront)

    algorithm = (sys.argv)[1]
    numOfVm = (sys.argv)[2]
    numOfApp = (sys.argv)[3]

    trueFrontAddr = "../paretoFront/trueFront/norm_" + str(numOfVm) + "_app" + str(numOfApp) + ".csv"
    trueFront = readCSV(trueFrontAddr)

    igdList = list()
    for i in range(1, 40):
        frontAddr = "../" + algorithm + "/" + numOfVm + "/app" + numOfApp + "/" + str(i) + "/normParetoFront.csv"
        front = readCSV(frontAddr)
        igd = evaluate(trueFront, front)
        igdList.append(igd)

    print(statistics.mean(igdList))
    print(statistics.stdev(igdList))
