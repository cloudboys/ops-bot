#!/usr/bin/env python

import sys
import csv
import json
import os

UUID = sys.argv[1]
print(UUID)

csvfile_name = "/tmp/"+UUID+".csv"
jsonfile_name = "/tmp/"+UUID+".json"

os.system('touch '+ jsonfile_name)

csvfile = open(csvfile_name, 'r')
jsonfile = open(jsonfile_name, 'w')

fieldnames = ("_raw","_time","awstag","envtype","host","__mv__raw","__mv__time","__mv_awstag","__mv_envtype","__mv_host")
reader = csv.DictReader( csvfile, fieldnames)
for row in reader:
    json.dump(row, jsonfile)
    jsonfile.write('\n')

