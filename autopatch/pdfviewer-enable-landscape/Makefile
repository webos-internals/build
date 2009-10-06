NAME = pdfviewer-enable-landscape
PATCH = /pdfviewer/${NAME}.patch
TITLE = PdfViewer Enable Landscape
DESCRIPTION = Enables landscape mode in the PdfViewer Application.  Requires the 'Extract PdfViewer App' package be installed first.
CATEGORY = PDF Viewer
VERSION = 0.4.4
DEPENDS = org.webosinternals.pdfviewer-extract-app
ICON = 
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
