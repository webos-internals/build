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
    url = ""
    filename = ""
    title = ""
    json = ""
    author = ""
    version = ""
    screenshots = []

    def startElement(self, name, attrs):
        if ((name == "application") or (name == "theme")) :
            self.title = ""
            self.json = "{ "
            self.author = ""
            self.version = ""
            self.screenshots = []

        self.getData = 1
        self.data = ""
            
    def endElement(self,name):
        self.getData = 0

        if (name == "title") :
            self.title = self.data
            sys.stderr.write("Found  " + self.title + "\n")
            self.json += "\"Title\":\"%s\", " % self.data

        if (name == "version") :
            self.version = self.data.replace(" ","-")

        if (name == "lastupdate") :
            self.json += "\"LastUpdated\":\"%s\", " % self.data

        if (name == "icon") :
            self.json += "\"Icon\":\"%s\", " % self.data

        if (name == "license") :
            self.json += "\"License\":\"%s\", " % self.data

        if (name == "description") :
            self.json += "\"FullDescription\":\"%s\", " % self.data

        if (name == "categories") :
            self.json += "\"Category\":\"%s\", " % self.data

        if (name == "author") :
            self.author = self.data

        if (name == "link") :
            self.json += "\"Homepage\":\"%s\", " % self.data.replace("homebrew-apps/homebrew-apps","homebrew-apps")

        if (name == "url") :
            self.url = self.data
            self.type = "Application"

        if (name == "themezip") :
            self.url = self.data
            self.type = "Theme"

        if (name == "screenshot") :
            self.screenshots.append('"' + self.data + '"')

        if ((name == "application") or (name == "theme")):

            # Unsuitable packages for Preware
            if (self.title == "Preware"): return
            if (self.title == "AutoCorrect Edit"): return
            if (self.title == "Pre Backup Utility"): return
            if (self.title == "Zip Codes"): return
            if (self.title == "ZIP Code Tools"): return
            if (self.type  == "Patch"): return

            regexp = re.compile("^(.*)/([^/]+(.ipk|.zip))")
            m = regexp.match(self.url)
            if (m):
                self.filename = m.group(2)

                if (len(self.screenshots)):
                    self.json += "\"Screenshots\":[" + ','.join(self.screenshots) + "], "

                self.json += "\"Source\":\"%s\", " % self.url

                self.json += "\"Type\":\"%s\", " % self.type

                if (name == "theme"):
                    self.json += "\"PostInstallFlags\":\"RestartLuna\", "
                    self.json += "\"PostRemoveFlags\":\"RestartLuna\", "

                if (name == "theme"):
                    id = "net.precentral.themes." + self.title.strip().lower().replace('\\\"',"").replace("&amp;","-").replace("&#58; ","-").replace("_quick_install_2.0","").replace("_","-").replace(": ","-").replace("&","").replace("#","").replace("  "," ").replace(" ","-").replace(".","").replace("'","").replace("(","").replace(")","").replace("+","").replace("!","").replace("/","").rstrip("-") + "_" + self.version + "_all"
                    print "Filename: " + id + ".ipk"
                    self.filename = id + ".zip"
                else:
                    print "Filename: " + self.filename
                    self.json += "\"Location\":\"%s\", " % self.url

                self.json += "\"Feed\":\"PreCentral\" }"

                print "Title: " + self.title
                print "Source: " + self.json
                if (name == "application"):
                    if (self.author):
                        print "MaintainerURL: " + "http://forums.precentral.net/members/" + urllib.quote(self.author) + ".html"

                if (not os.path.exists(sys.argv[2] + "/" + self.filename)) :
                    sys.stderr.write("Fetching: " + self.filename + "\n")
                    os.system("curl -R -L -f -o " + sys.argv[2] + "/" + self.filename + " " + self.url)

                files[self.filename] = 1

                print

        return

    def characters (self, ch): 
        if (self.getData) :
            self.data += ch.encode('utf-8').replace("\\\\'", "\\'").replace("\\'", "'").replace('"', '\\"').replace('\t', '\\t').replace('\r', '\\r').replace('\n', '\\n')

        return

feedprint = PackageHandler()
saxparser = make_parser()
saxparser.setContentHandler(feedprint)
                        
datasource = open(sys.argv[1],"r")
saxparser.parse(datasource)

for f in os.listdir(sys.argv[2]):
    if (not files.has_key(f)):
        sys.stderr.write(sys.argv[2] + "/" + f + "\n")
        os.remove(sys.argv[2] + "/" + f)
