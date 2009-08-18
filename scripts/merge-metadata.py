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
        metadata[key] = None

    regexp = re.compile('^Source: (.*)$')
    m = regexp.match(line)
    if (m):
        metadata[key] = m.group(1)

packagedata = ""

for line in fileinput.input([sys.argv[2]]) :

    if line == "\n":
        continue

    packagedata += line

    regexp = re.compile('^Filename: (.*)$')
    m = regexp.match(line)
    if (m):
        key = m.group(1)
        if key in metadata:
            packagedata += "Source: " + metadata[key] + "\n"

    regexp = re.compile('^Description: (.*)$')
    m = regexp.match(line)
    if (m):
        if key in metadata:
            print packagedata
            print
        packagedata = ""
