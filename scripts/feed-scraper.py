#!/usr/bin/python

import os
import sys
import re
import fileinput

packagedata = ""

for line in fileinput.input([sys.argv[1]]) :

    if line == "\n":
        continue

    line = line.replace('\r','')

    keepline = 1

    # A Package: line denotes the start of a package
    regexp = re.compile('^Package: (.*)$')
    m = regexp.match(line)
    if (m):
        packagedata = ""

    if (keepline):
        packagedata += line

    regexp = re.compile('^Filename: (.*)$')
    m = regexp.match(line)
    if (m):
        key = m.group(1)
        
        if (not os.path.exists(sys.argv[2] + "/" + key)) :
            sys.stderr.write("Fetching: " + key + "\n")
            os.system("curl -R -L -o " + sys.argv[2] + "/" + key + " " + sys.argv[3] + "/" + key)

    regexp = re.compile('^Description: (.*)$')
    m = regexp.match(line)
    if (m):
        print packagedata
        print
