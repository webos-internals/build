NAME = $(shell basename $(shell pwd))
PATCH = /pdf-viewer/${NAME}.patch
TITLE = Enable Landscape PDF Viewer
DESCRIPTION = Enables landscape mode in the PDF Viewer Application.  Requires the 'Extract PDF Viewer Application' package be installed first.
CATEGORY = PDF Viewer
VERSION = 1.2.1-0
DEPENDS = org.webosinternals.pdfviewer-extract-app
ICON = http://www.webos-internals.org/images/7/71/Icon_WebOSInternals_Patches_Pdfviewer.png
SCREENSHOTS = 
META_VERSION = 1

include ../common.mk
include ../modifications.mk

build/all/CONTROL/postinst: build/.unpacked
	mkdir -p build/all/CONTROL
	cp ../postinst build/all/CONTROL/postinst
	sed -i -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' build/all/CONTROL/postinst
	sed -i -e 's|APP_DIR=|APP_DIR=/var/usr/palm/applications/${APP_ID}|' build/all/CONTROL/postinst
	chmod ugo+x $@

MAINTAINER = Hopspitfire
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_PDF_Viewer
