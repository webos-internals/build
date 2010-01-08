#!/usr/bin/python

from xml.sax.handler import ContentHandler
from xml.sax import make_parser
import sys
import re
import urllib
import os

files = {}

class PackageHandler(ContentHandler):
    getData = 0
    getIcons = 0
    getIcon = 0
    url = ""
    filename = ""
    title = ""
    json = ""
    author = ""
    version = ""
    screenshots = []

    def startElement(self, name, attrs):
        if (name == "item") :
            self.id = ""
            self.title = ""
            self.json = "{ "
            self.author = ""
            self.support = ""
            self.version = ""
            self.category = ""
            self.icon = ""
            self.screenshots = []

        if (name == "ac:categories"):
            self.category = attrs["ac:primary"].encode('utf-8')

        if (name == "ac:icons"):
            self.getIcons = 1

        if (name == "ac:asset_url"):
            if (attrs["ac:type"] == "app"):
                if (self.getIcons):
                    self.getIcon = 1

        self.getData = 1
        self.data = ""
            
    def endElement(self,name):
        self.getData = 0

        if (name == "title") :
            self.title = self.data
            self.json += "\"Title\":\"%s\", " % self.data

        if (name == "link") :
            self.json += "\"Homepage\":\"%s\", " % self.data

        if (name == "description") :
            self.json += "\"FullDescription\":\"%s\", " % self.data

        if (name == "pubDate") :
            self.json += "\"LastUpdated\":\"%s\", " % self.data

        if (name == "ac:packageid") :
            self.id = self.data

        if (name == "ac:version") :
            self.version = self.data

        if (name == "ac:developer") :
            self.author = self.data

        if (name == "ac:support_url") :
            self.support = self.data

        if (name == "ac:icons"):
            self.getIcons = 0

        if (name == "ac:asset_url") :
            if (self.getIcon):
                self.icon = self.data
                self.getIcon = 0

        if (name == "link") :
            self.url = self.data
            self.type = "AppCatalog"

        if (name == "item"):

            self.json += "\"Source\":\"%s\", " % self.url

            self.json += "\"Type\":\"%s\", " % self.type

            if (self.category):
                self.json += "\"Category\":\"%s\", " % self.category

            if (self.icon):
                self.json += "\"Icon\":\"%s\", " % self.icon

            self.json += "\"Feed\":\"Palm %s\" }" % sys.argv[2]

            print "Package: " + self.id
            print "Version: " + self.version
            print "Section: " + self.category
            print "Architecture: all"
            print "Maintainer: %s <%s>" % (self.author, self.support)
            print "Source: " + self.json
            print "Description: " + self.title
            print

        return

    def characters (self, ch): 
        if (self.getData) :
            self.data += ch.encode('utf-8').replace('"', '\\"').replace(': ', '&#58; ').replace('\r', '').replace('\n', '')

        return

feedprint = PackageHandler()
saxparser = make_parser()
saxparser.setContentHandler(feedprint)
                        
datasource = open(sys.argv[1],"r")
saxparser.parse(datasource)
