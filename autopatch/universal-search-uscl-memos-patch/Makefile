NAME = $(shell basename $(shell pwd))
PATCH = universal-search/${NAME}.patch
TITLE = USCL Memos Patch
DESCRIPTION = "This will allow the Universal Search Command Line\'s \".memo\" command to work. You must have the main \"Universal Search Command Line\" patch installed in order for this to take effect. Preware should automatically install USCL if needed."
CATEGORY = Universal Search
VERSION = 1.2.1-18
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [\"http://www.webos-internals.org/images/4/47/Universal-search-uscl-memos-patch-1.png\"]
META_SUB_VERSION = 2

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.pdf-viewer-extract-app
include ../modifications.mk

MAINTAINER = dsevil <dse@webonastick.com>
HOMEPAGE = http://webonastick.com/webos/patches/
