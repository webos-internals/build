#!/usr/bin/python

import os
import sys
import time
import re
import urllib
import fileinput

json = ""

for line in fileinput.input([sys.argv[1]]) :

    url = line

    regexp = re.compile("^(.*)/([^/]+.ipk)")
    m = regexp.match(line)
    if (m) :
        name = m.group(2)
        
        json = "{ "
        print "Filename: " + name

        pathname = sys.argv[2] + "/" + name

        if (not os.path.exists(pathname)) :
            urllib.urlretrieve(url, pathname)

        (mode, ino, dev, nlink, uid, gid, size, atime, mtime, ctime) = os.stat(pathname)
        json += "\"Last-Updated\":\"%d\", " % ctime

        json = json[:-2]
        json += " }"
        print "Source: " + json
        print
