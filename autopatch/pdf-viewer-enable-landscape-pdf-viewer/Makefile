NAME = $(shell basename $(shell pwd))
PATCH = pdf-viewer/${NAME}.patch
TITLE = Enable Landscape PDF Viewer
DESCRIPTION = Enables landscape mode in the PDF Viewer Application.  Requires the 'Extract PDF Viewer Application' package be installed first.
CATEGORY = PDF Viewer
VERSIONS = 1.2.1-1 1.3.1-0 1.3.5-5 1.4.0-1
ICON = http://www.webos-internals.org/images/7/71/Icon_WebOSInternals_Patches_Pdfviewer.png
SCREENSHOTS = 
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.pdf-viewer-extract-app

include ../modifications.mk

MAINTAINER = Hopspitfire
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_PDF_Viewer
