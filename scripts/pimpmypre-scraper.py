#!/usr/bin/python

import os
import sys
import re
import urllib
import fileinput


for line in fileinput.input([sys.argv[1]]) :

    regexp = re.compile('"url"')
    m = regexp.search(line)
    if (not m) :
        continue

    regexp = re.compile('.+"url":"(http://[^"]+\.ipk)".+')
    m = regexp.search(line)
    if (m) :
        url = m.group(1)

        regexp = re.compile("^(.*)/([^/]+.ipk)")
        m = regexp.match(url)
        if (m) :
            name = m.group(2)

            print "Filename: " + name

            if (not os.path.exists(sys.argv[2] + "/" + name)) :
                urllib.urlretrieve(url, sys.argv[2] + "/" + name)
