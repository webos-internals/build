NAME = $(shell basename $(shell pwd))
PATCH = pdf-viewer/${NAME}.patch
TITLE = Hide Header in PDF Viewer
DESCRIPTION = This hides the header with the filename so the search function is usable. Requires the 'Extract PDF Viewer Application' package to be installed first. Compatible with the other patches for PDF Viewer; however, note that using search in landscape mode may cause your phone to crash.
CATEGORY = PDF Viewer
VERSIONS = 1.3.1-27 1.3.5-10
ICON = http://www.webos-internals.org/images/7/71/Icon_WebOSInternals_Patches_Pdfviewer.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.pdf-viewer-extract-app
include ../modifications.mk

MAINTAINER = tarirene
HOMEPAGE =
