NAME = $(shell basename $(shell pwd))
PATCH = pdf-viewer/${NAME}.patch
TITLE = PDF Redux
DESCRIPTION = This patch makes multiple changes to the PDF View app to increase its usability:<br/><br/> - Remove title bar.<br/> - Make footer buttons translucent.<br/> - Make page number transparent except when selected.<br/> - Add button to rotate view between portrait and landscape.<br/> - Add a 'back' button to jump to previous location in a document.<br/> - Keep track of rotation of and location in a document for 30 days and restore them when reloading the document.
CATEGORY = PDF Viewer
VERSIONS = 1.3.1-27 1.3.5-10 1.4.0-1
ICON = http://www.webos-internals.org/images/7/71/Icon_WebOSInternals_Patches_Pdfviewer.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/d/d8/Pdf-viewer-pdf-redux-1.jpg\",\
\"http://www.webos-internals.org/images/a/ac/Pdf-viewer-pdf-redux-2.jpg\",\
\"http://www.webos-internals.org/images/4/49/Pdf-viewer-pdf-redux-3.jpg\"]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.pdf-viewer-extract-app
include ../modifications.mk

MAINTAINER = akamil <akamil@gmail.com>
HOMEPAGE =
