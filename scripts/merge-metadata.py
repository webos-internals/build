#!/usr/bin/python

import os
import sys
import re
import fileinput

key = ""
metadata = {}

for line in fileinput.input([sys.argv[1]]) :

    regexp = re.compile('^Filename: (.*)$')
    m = regexp.match(line)
    if (m):
        key = m.group(1)

    regexp = re.compile('^Source: (.*)$')
    m = regexp.match(line)
    if (m):
        metadata[key] = m.group(1)

for line in fileinput.input([sys.argv[2]]) :

    sys.stdout.write(line)

    regexp = re.compile('^Filename: (.*)$')
    m = regexp.match(line)
    if (m):
        key = m.group(1)
        if key in metadata:
            print "Source: " + metadata[key]
