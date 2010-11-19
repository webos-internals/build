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
    json = ""
    author = ""
    version = ""
    section = ""

    def startElement(self, name, attrs):
        if (name == "themeinfo") :
            self.json = "{ "
            self.author = ""
            self.version = ""
            print >>self.postinst, "#!/bin/sh"
            print >>self.postinst, ""
            print >>self.prerm,    "#!/bin/sh"
            print >>self.prerm,    ""

        if ((name == "wallpaper") or (name == "file") or (name == "icon")):
            self.section = name

        self.getData = 1
        self.data = ""
            
    def endElement(self,name):
        self.getData = 0

        if (name == "name") :
            regexp = re.compile("^([^_]+)")
            m = regexp.search(self.filename)
            print >>self.control,  "Package: %s" % m.group(1)
            print >>self.control,  "Description: %s" % self.data
            print >>self.postinst, "# Title: %s" % self.data
            print >>self.prerm,    "# Title: %s" % self.data

        if (name == "version") :
            print >>self.control, "Version: %s" % self.data
            regexp = re.compile("^[^_]+_([^_]+)")
            m = regexp.search(self.filename)
            if (self.data != m.group(1)):
                sys.stderr.write(self.filename + ": Version mismatch between feed and theme.xml\n")
                sys.exit(1)

        if (name == "creator") :
            print >>self.control,  "Maintainer: %s <http://forums.precentral.net/members/%s.html>" % (self.data, urllib.quote(self.data))
            print >>self.postinst, "# Author: %s" % self.data
            print >>self.prerm,    "# Author: %s" % self.data

        if (name == "themeinfo"):
            print >>self.control,  "Architecture: all"
            print >>self.control,  "Section: Themes"
            print >>self.control,  "Priority: optional"
            print >>self.control,  "Source: unknown"
            print >>self.postinst, ""
            print >>self.postinst, "mkdir -p /var/usr/lib/webos-quick-install/"
            print >>self.postinst, "cp /media/cryptofs/apps/net.precentral.themes/theme.xml /var/usr/lib/webos-quick-install/theme.xml"
            print >>self.prerm,    ""
            print >>self.prerm,    "rm -f /var/usr/lib/webos-quick-install/theme.xml"

        if (name == "image") :
            if (self.section == "wallpaper"):
                print >>self.postinst, ""
                print >>self.postinst, "mkdir -p /media/internal/wallpapers/"
                print >>self.postinst, "rm -f /media/internal/wallpapers/%s" % os.path.basename(self.data)
                print >>self.postinst, "cp /media/cryptofs/apps/net.precentral.themes/%s /media/internal/wallpapers/%s" % (self.data, os.path.basename(self.data))
                print >>self.postinst, ""
                print >>self.postinst, "luna-send -n 1 palm://com.palm.systemservice/wallpaper/importWallpaper '{ \"target\":\"/media/internal/wallpapers/%s\" }'" % os.path.basename(self.data)
                print >>self.postinst, "luna-send -n 1 palm://com.palm.systemservice/setPreferences '{ \"wallpaper\": { \"wallpaperName\":\"%s\", \"wallpaperFile\":\"/media/internal/wallpapers/%s\" } }'" % (os.path.basename(self.data), os.path.basename(self.data))
                print >>self.prerm,    ""
                print >>self.prerm,    "rm -f /media/internal/wallpapers/%s" % self.data
                print >>self.prerm,    ""
                print >>self.prerm,    "luna-send -n 1 palm://com.palm.systemservice/setPreferences '{ \"wallpaper\": { \"wallpaperName\":\"01.jpg\", \"wallpaperFile\":\"/media/internal/wallpapers/01.jpg\" } }'"

        if (name == "filename") :
            if (self.section == "file"):
                self.file = self.data

        if (name == "destination") :
            if (self.section == "file"):
                print >>self.postinst, ""
                print >>self.postinst, "if [ -f %s -a ! -f %sBACKUP ] ; then" % (self.data, self.data)
                print >>self.postinst, "  cp %s %sBACKUP" % (self.data, self.data)
                print >>self.postinst, "fi"
                print >>self.postinst, "cp /media/cryptofs/apps/net.precentral.themes/%s %s" % (self.file, self.data)
                print >>self.prerm,    ""
                print >>self.prerm,    "if [ -f %sBACKUP ] ; then" % self.data
                print >>self.prerm,    "  mv %sBACKUP %s" % (self.data, self.data)
                print >>self.prerm,    "fi"

        if (name == "appid") :
            if (self.section == "icon"):
                self.appid = self.data

        if (name == "image") :
            if (self.section == "icon"):
                self.file = self.data
                self.data = "/usr/palm/applications/%s/icon.png" % self.appid
                print >>self.postinst, ""
                print >>self.postinst, "if [ -f %s -a ! -f %sBACKUP ] ; then" % (self.data, self.data)
                print >>self.postinst, "  cp %s %sBACKUP" % (self.data, self.data)
                print >>self.postinst, "fi"
                print >>self.postinst, "cp /media/cryptofs/apps/net.precentral.themes/%s %s" % (self.file, self.data)
                print >>self.prerm,    ""
                print >>self.prerm,    "if [ -f %sBACKUP ] ; then" % self.data
                print >>self.prerm,    "  mv %sBACKUP %s" % (self.data, self.data)
                print >>self.prerm,    "fi"

        if (name == "themelist"):
            print >>self.postinst, ""
            print >>self.postinst, "exit 0"
            print >>self.prerm,    ""
            print >>self.prerm,    "rm -f /var/usr/lib/webos-quick-install/theme.xml"
            print >>self.prerm,    ""
            print >>self.prerm,    "exit 0"

    def characters (self, ch): 
        if (self.getData) :
            self.data += ch.encode('utf-8').replace('"', '\\"').replace('\r', '').replace('\n', '')

        return

feedprint = PackageHandler()
feedprint.control = open(sys.argv[2] + "/CONTROL/control", 'w')
feedprint.postinst = open(sys.argv[2] + "/CONTROL/postinst", 'w')
feedprint.prerm = open(sys.argv[2] + "/CONTROL/prerm", 'w')
feedprint.filename = sys.argv[3]
saxparser = make_parser()
saxparser.setContentHandler(feedprint)
                        
datasource = open(sys.argv[1],"r")
saxparser.parse(datasource)
