NAME = $(shell basename $(shell pwd))
PATCH = pdf-viewer/${NAME}.patch
TITLE = PDF Redux
DESCRIPTION = This patch makes multiple changes to the PDF Viewer app to increase its usability:<br/> - Remove title bar.<br/> - Make footer buttons translucent.<br/> - Make page number transparent except when selected.<br/> - Add button to rotate view between portrait and landscape.<br/> - Add a 'back' button to jump to previous location in a document.<br/> - Keep track of rotation of and location in a document for 30 days and restore them when reloading the document.<br/>- Add option to load last document on startup.<br/>- Add option to use accelerometer for rotation.<br/>NOTE: This patch is NOT compatible with the Enable Landscape PDF Viewer patch.
CATEGORY = PDF Viewer
VERSIONS = 1.3.5-12 1.4.0-37 1.4.1-6
ICON = http://www.webos-internals.org/images/7/71/Icon_WebOSInternals_Patches_Pdfviewer.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/d/d8/Pdf-viewer-pdf-redux-1.jpg\",\
\"http://www.webos-internals.org/images/a/ac/Pdf-viewer-pdf-redux-2.jpg\",\
\"http://www.webos-internals.org/images/4/49/Pdf-viewer-pdf-redux-3.jpg\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = akamil <akamil@gmail.com>
HOMEPAGE =