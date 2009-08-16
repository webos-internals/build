#!/usr/bin/python

import os
import sys
import re
import urllib
import fileinput

json = ""

for line in fileinput.input([sys.argv[1]]) :

    regexp = re.compile('.+"appid":"([^"]+)".+')
    m = regexp.search(line)
    if (m) :
        appid = m.group(1)
        json += "\"appid\":\"%s\" }" % appid
#        print "Source: " + json
        print

    regexp = re.compile('.+"title":"([^"]+)".+')
    m = regexp.search(line)
    if (m) :
        title = m.group(1)
        json += "\"title\":\"%s\", " % title

    regexp = re.compile('.+"content":"([^"]+)".+')
    m = regexp.search(line)
    if (m) :
        description = m.group(1)
        json += "\"description\":\"%s\", " % description

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

            if (not os.path.exists(sys.argv[2] + "/" + name)) :
                urllib.urlretrieve(url, sys.argv[2] + "/" + name)
