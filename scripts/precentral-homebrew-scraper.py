#!/usr/bin/python

from xml.sax.handler import ContentHandler
from xml.sax import make_parser
import sys
import re

class PackageHandler(ContentHandler):
    printContent = 0
    getName = 0
    name = ""

    def startElement(self, name, attrs):
        if (name == "title") :
            sys.stdout.write( "Description: " )
            self.printContent = 1
        elif (name == "url") :
            sys.stdout.write( "Source: " )
            self.printContent = 1
            self.getName = 1
        elif (name == "size") :
            sys.stdout.write( "Size: " )
            self.printContent = 1
        elif (name == "author") :
            sys.stdout.write( "Maintainer: " )
            self.printContent = 1
        elif (name == "version") :
            sys.stdout.write( "Version: " )
            self.printContent = 1
        elif (name == "link") :
            sys.stdout.write( "Homepage: " )
            self.printContent = 1
        return
            
    def endElement(self,name):
        if (self.printContent) :
            print

        self.printContent = 0
        self.getName = 0

        if (name == "application") :
            print "Architecture: all"
            print "Section: web"
            regexp = re.compile("^(.*)/([^/]+).ipk")
            m = regexp.match(self.name)
            self.name = m.group(2)

            sys.stdout.write("Filename: ")
            sys.stdout.write(self.name)
            sys.stdout.write(".ipk\n")

            sys.stdout.write("Package: ")

            regexp = re.compile("_(\.)")
            self.name = regexp.sub(".", self.name)

            regexp = re.compile("_all")
            self.name = regexp.sub("", self.name)

            regexp = re.compile("_rev[0-9._]+")
            self.name = regexp.sub("", self.name)

            regexp = re.compile("(-|_)[0-9.]+")
            self.name = regexp.sub("", self.name)

            regexp = re.compile("_all")
            self.name = regexp.sub("", self.name)

            print self.name
            print

        return

    def characters (self, ch): 
        if (self.getName) :
            self.name = ch

        if (self.printContent) :
            sys.stdout.write( ch )

        return

feedprint = PackageHandler()
saxparser = make_parser()
saxparser.setContentHandler(feedprint)
                        
datasource = open(sys.argv[1] + "/" + sys.argv[2],"r")
saxparser.parse(datasource)
