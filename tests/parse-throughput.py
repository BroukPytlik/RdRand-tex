#!/bin/env python2

import json


with open ("throughput.json","r") as myfile:
	mystr=myfile.read()

data=json.loads(mystr)

throughputs=[]
i=0
for test in data:
	i = i+1
	for line in test.split("\n"):
		words=line.split()
		if words[3] == "100.00":
#			throughputs.append([words[0],words[1]])
#			print words[0], " - ", words[1], " - ", words[3], " %"
			print i,words[1] # print throughput
			break

