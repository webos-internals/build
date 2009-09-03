#!/usr/bin/python

import os
import sys
import time
import re
import urllib
import fileinput

json = ""

files = {}

for line in fileinput.input([sys.argv[1]]) :

    regexp = re.compile('.+"appid":"([^"]+)".+')
    m = regexp.search(line)
    if (m) :
        appid = m.group(1)
#        json += "\"appid\":\"%s\" }" % appid

        json += "\"Type\":\"Application\", "

        json += "\"Category\":\"Unsorted\", "

        json += "\"Feed\":\"PimpMyPre\" }"

        print "Source: " + json
        print

    regexp = re.compile('.+"title":"([^"]+)".+')
    m = regexp.search(line)
    if (m) :
        title = m.group(1)
        json += "\"Title\":\"%s\", " % title

    regexp = re.compile('.+"content":"([^"]+)".+')
    m = regexp.search(line)
    if (m) :
        description = m.group(1)
        json += "\"FullDescription\":\"%s\", " % description

    regexp = re.compile('.+"url":"(http://[^"]+\.ipk)".+')
    m = regexp.search(line)
    if (m) :
        url = m.group(1)

        regexp = re.compile("^(.*)/([^/]+.ipk)")
        m = regexp.match(url)
        if (m) :
            name = m.group(2)

            json = "{ "
            print "Filename: " + name

            pathname = sys.argv[2] + "/" + name

            if (not os.path.exists(pathname)) :
                urllib.urlretrieve(url, pathname)

            files[name] = 1

            (mode, ino, dev, nlink, uid, gid, size, atime, mtime, ctime) = os.stat(pathname)
            json += "\"Last-Updated\":\"%d\", " % ctime
            json += "\"LastUpdated\":\"%d\", " % ctime

for f in os.listdir(sys.argv[2]):
    if (not files.has_key(f)):
        sys.stderr.write(sys.argv[2] + "/" + f + "\n")
        os.remove(sys.argv[2] + "/" + f)
