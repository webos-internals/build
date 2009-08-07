#!/usr/bin/python

from xml.sax.handler import ContentHandler
from xml.sax import make_parser
import sys
import re
import urllib
import os

class PackageHandler(ContentHandler):
    getName = 0
    name = ""
    url = ""

    def startElement(self, name, attrs):
        if (name == "url") :
            self.getName = 1
        return
            
    def endElement(self,name):
        self.getName = 0

        if (name == "application") :

            self.url = self.name

            regexp = re.compile("^(.*)/([^/]+.ipk)")
            m = regexp.match(self.name)
            if (m):
                self.name = m.group(2)

                print "Filename: " + self.name

                if (not os.path.exists(sys.argv[2] + "/" + self.name)) :
                    urllib.urlretrieve(self.url, sys.argv[2] + "/" + self.name)

        return

    def characters (self, ch): 
        if (self.getName) :
            self.name = ch

        return

feedprint = PackageHandler()
saxparser = make_parser()
saxparser.setContentHandler(feedprint)
                        
datasource = open(sys.argv[1],"r")
saxparser.parse(datasource)
