#!/usr/bin/python

from xml.sax.handler import ContentHandler
from xml.sax import make_parser
import sys
import re
import urllib
import os
import stat
import time
import calendar
import hashlib

files = {}

class PackageHandler(ContentHandler):
    getData = 0
    inItem = 0
    getIcons = 0
    getScreenshots = 0
    getIcon = 0
    getScreenshot = 0
    language = ""
    id = ""
    title = ""
    description = ""
    license = ""
    json = ""
    author = ""
    support = ""
    version = ""
    size = 0
    price = 0.00
    category = ""
    icon = ""
    screenshots = []
    filename = ""
    appnumber = ""
    md5sum = ""
    countries = []

    def startElement(self, name, attrs):
        if (name == "item") :
            self.inItem = 1
            self.language = ""
            self.id = ""
            self.title = ""
            self.description = ""
            self.license = ""
            self.json = "{ "
            self.author = ""
            self.support = ""
            self.version = ""
            self.size = 0
            self.price = 0.00
            self.category = ""
            self.icon = ""
            self.screenshots = []
            self.filename = ""
            self.appnumber = ""
            self.md5sum = ""
            self.countries = []

        if (name == "ac:localization"):
            self.language = attrs["ac:language"].encode('utf-8')
            country = '"' + attrs["ac:country"].encode('utf-8') + '"'
            if (country not in self.countries):
                self.countries.append('"' + attrs["ac:country"].encode('utf-8') + '"')

        if (name == "ac:categories"):
            if (self.language == "en"):
                self.category = attrs["ac:primary"].encode('utf-8')

        if (name == "ac:icons"):
            self.getIcons = 1

        if (name == "ac:images"):
            self.getScreenshots = 1

        if (name == "ac:asset_url"):
            if (attrs["ac:type"] == "app"):
                if (self.getIcons):
                    self.getIcon = 1
            if (attrs["ac:type"] == "large"):
                if (self.getScreenshots):
                    self.getScreenshot = 1

        self.getData = 1
        self.data = ""
            
    def endElement(self,name):
        self.getData = 0

        if (name == "link") :
            self.url = self.data
            self.json += "\"Homepage\":\"%s\", " % self.data

        if (name == "pubDate") :
            if (self.inItem):

                if (self.data.find("-0800") > 0):
                    secs = calendar.timegm(time.strptime(self.data, "%a, %d %b %Y %H:%M:%S -0800")) + 8*3600
                elif (self.data.find("-0700") > 0):
                    secs = calendar.timegm(time.strptime(self.data, "%a, %d %b %Y %H:%M:%S -0700")) + 7*3600
                    
                self.json += "\"LastUpdated\":\"%s\", " % secs

        if (name == "ac:packageid") :
            self.id = self.data

        if (name == "ac:version") :
            self.version = self.data
            
        if (name == "ac:license") :
            self.license = self.data
            
        if (name == "ac:installed_size") :
            self.size = int(self.data)
            
        if (name == "ac:price") :
            self.price = float(self.data)
            
        if (name == "ac:asset_url") :
            if (self.getIcon):
                self.icon = self.data
                self.getIcon = 0
            if (self.getScreenshot):
                self.screenshots.append('"' + self.data + '"')
                self.getScreenshot = 0

        if (self.language == "en"):

            if ((name == "title") or (name == "ac:title")):
                self.title = self.data
                
            if ((name == "description") or (name == "ac:summary")):
                self.description = self.data

            if (name == "ac:developer") :
                self.author = self.data

            if (name == "ac:support_url") :
                self.support = self.data

        if ((name == "item") and (self.title != "")):

            if (self.icon and self.id and self.version and self.price == 0):
                regexp = re.compile("^http://cdn.downloads.palm.com/public/([0-9]+)/.*")
                m = regexp.match(self.icon)
                if (m):
                    self.appnumber = m.group(1)
                    self.filename = self.id + "_" + self.version + "_all.ipk"
                    self.url = "https://cdn.downloads.palm.com/apps/" + self.appnumber + "/files/" + self.filename

            self.json += "\"Title\":\"%s\", " % self.title

            self.json += "\"FullDescription\":\"%s\", " % self.description

            self.json += "\"Source\":\"%s\", " % self.url

            self.json += "\"Type\":\"AppCatalog\", "

            if (self.license):
                self.json += "\"License\":\"%s\", " % self.license

            if (self.category):
                self.json += "\"Category\":\"%s\", " % self.category

            if (self.icon):
                self.json += "\"Icon\":\"%s\", " % self.icon

            if (self.price):
                if (self.price != 0):
                    self.json += "\"Price\":\"%.02f\", " % self.price

            if (len(self.screenshots)):
                self.json += "\"Screenshots\":[" + ','.join(self.screenshots) + "], "

            if (len(self.countries)):
                self.json += "\"Countries\":[" + ','.join(self.countries) + "], "

            self.json += "\"Feed\":\"Palm %s\" }" % sys.argv[3]

            if (self.filename and self.price == 0):
                if (not os.path.exists(sys.argv[2] + "/" + self.filename)):
                    sys.stderr.write("Fetching: " + self.filename + "\n")
                    os.system("curl -k -R -L -o " + sys.argv[2] + "/" + self.filename + " " + self.url)
                if (os.path.exists(sys.argv[2] + "/" + self.filename)):
                    files[self.filename] = 1
                    self.size = os.stat(sys.argv[2] + "/" + self.filename)[stat.ST_SIZE]
                    m = hashlib.md5();
                    m.update(file(sys.argv[2] + "/" + self.filename).read());
                    self.md5sum = m.hexdigest()

            print "Package: " + self.id
            print "Version: " + self.version
            print "Section: " + self.category
            print "Architecture: all"
            print "Maintainer: %s <%s>" % (self.author, self.support)
            if (self.md5sum):
                print "MD5Sum: %s" % self.md5sum
            print "Size: %d" % self.size
            if (files.has_key(self.filename)):
                print "Filename: apps/" + self.appnumber + "/files/" + self.filename
            print "Source: " + self.json
            print "Description: " + self.title
            print

            inItem = 0

        if (name == "ac:icons"):
            self.getIcons = 0

        if (name == "ac:images"):
            self.getScreenshots = 0

        if (name == "ac:localization"):
            self.language = ""

        return

    def characters (self, ch): 
        if (self.getData) :
            self.data += ch.encode('utf-8').replace("\\\\'", "\\'").replace("\\'", "'").replace('"', '\\"').replace(': ', '&#58; ').replace('\r', '').replace('\n', '')

        return

feedprint = PackageHandler()
saxparser = make_parser()
saxparser.setContentHandler(feedprint)
                        
datasource = open(sys.argv[1],"r")
saxparser.parse(datasource)

# for f in os.listdir(sys.argv[2]):
#     if (not files.has_key(f)):
#         sys.stderr.write(sys.argv[2] + "/" + f + "\n")
#         os.remove(sys.argv[2] + "/" + f)
