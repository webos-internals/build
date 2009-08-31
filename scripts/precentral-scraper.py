#!/usr/bin/python

from xml.sax.handler import ContentHandler
from xml.sax import make_parser
import sys
import re
import urllib
import os

class PackageHandler(ContentHandler):
    getData = 0
    url = ""
    filename = ""
    json = ""
    section = ""
    screenshots = []

    def startElement(self, name, attrs):
        if (name == "application") :
            self.json = "{ "
            self.section = ""
            self.screenshots = []

        self.getData = 1
            
    def endElement(self,name):
        self.getData = 0

        if (name == "title") :
            self.json += "\"Title\":\"%s\", " % self.data.replace('"', '\\"')

        if (name == "lastupdate") :
            self.json += "\"Last-Updated\":\"%s\", " % self.data
            self.json += "\"LastUpdated\":\"%s\", " % self.data

        if (name == "icon") :
            self.json += "\"Icon\":\"%s\", " % self.data.replace('"', '\\"')

        if (name == "license") :
            self.json += "\"License\":\"%s\", " % self.data.replace('"', '\\"')

#        if (name == "description") :
#            self.json += "\"FullDescription\":\"%s\", " % self.data.replace('"', '\\"')

        if (name == "categories") :
            self.json += "\"Type\":\"Application\", "
            self.json += "\"Category\":\"%s\", " % self.data.replace('"', '\\"')
            self.section = self.data

        if (name == "link") :
            self.json += "\"Homepage\":\"%s\", " % self.data.replace("homebrew-apps/homebrew-apps","homebrew-apps").replace('"', '\\"')

        if (name == "url") :
            self.url = self.data

        if (name == "screenshot") :
            self.screenshots.append('"' + self.data.replace('"', '\\"') + '"')

        if (name == "application") :

            regexp = re.compile("^(.*)/([^/]+.ipk)")
            m = regexp.match(self.url)
            if (m):
                self.filename = m.group(2)

                if (len(self.screenshots)):
                    self.json += "\"Screenshots\":[" + ','.join(self.screenshots) + "], "

                self.json += "\"Feed\":\"PreCentral\" }"

                print "Filename: " + self.filename
                print "Source: " + self.json
                if (self.section):
                    print "Section: " + self.section

                if (not os.path.exists(sys.argv[2] + "/" + self.filename)) :
                    urllib.urlretrieve(self.url, sys.argv[2] + "/" + self.filename)

                print

        return

    def characters (self, ch): 
        if (self.getData) :
            self.data = ch.encode('utf-8')

        return

feedprint = PackageHandler()
saxparser = make_parser()
saxparser.setContentHandler(feedprint)
                        
datasource = open(sys.argv[1],"r")
saxparser.parse(datasource)
