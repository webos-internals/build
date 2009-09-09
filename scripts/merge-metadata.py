#!/usr/bin/python

import os
import sys
import re
import fileinput

key = ""
metadata = {}
maintainerurl = {}

for line in fileinput.input([sys.argv[1]]) :

    regexp = re.compile('^Filename: (.*)$')
    m = regexp.match(line)
    if (m):
        key = m.group(1)

    regexp = re.compile('^Source: (.*)$')
    m = regexp.match(line)
    if (m):
        metadata[key] = m.group(1)

    regexp = re.compile('^MaintainerURL: (.*)$')
    m = regexp.match(line)
    if (m):
        maintainerurl[key] = m.group(1)

packagedata = ""
maintainer = ""

for line in fileinput.input([sys.argv[2]]) :

    if line == "\n":
        continue

    keepline = 1

    # A Package: line denotes the start of a package
    regexp = re.compile('^Package: (.*)$')
    m = regexp.match(line)
    if (m):
        packagedata = ""
        maintainer = ""

    # Elide Source: lines
    regexp = re.compile('^Source: (.*)$')
    m = regexp.match(line)
    if (m):
        keepline = 0

    # Save Maintainer: lines for later processing
    regexp = re.compile('^Maintainer: (.*)$')
    m = regexp.match(line)
    if (m):
        maintainer = m.group(1)
        keepline = 0

    if (keepline):
        packagedata += line

    regexp = re.compile('^Filename: (.*)$')
    m = regexp.match(line)
    if (m):
        key = m.group(1)
        if key in metadata:
            packagedata += "Source: " + metadata[key] + "\n"
        if maintainer:
            regexp = re.compile('^(.*\S)\s*<(.*)>$')
            m = regexp.match(maintainer)
            if m:
                if (m.group(2) == "palm@palm.com"):
                    if (key in maintainerurl):
                        packagedata += "Maintainer: " + m.group(1) + " <" + maintainerurl[key] + ">" + "\n"
                    else:
                        packagedata += "Maintainer: " + m.group(1) + "\n"
                else:
                    packagedata += "Maintainer: " + maintainer + "\n"
                    
            else:
                if (key in maintainerurl):
                    packagedata += "Maintainer: " + maintainer + " <" + maintainerurl[key] + ">" + "\n"
                else:
                    packagedata += "Maintainer: " + maintainer + "\n"
                
                
    regexp = re.compile('^Description: (.*)$')
    m = regexp.match(line)
    if (m):
        if key in metadata:
            print packagedata
            print
