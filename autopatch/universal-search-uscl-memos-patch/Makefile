NAME = $(shell basename $(shell pwd))
PATCH = universal-search/${NAME}.patch
TITLE = USCL Memos Patch
DESCRIPTION = This will allow the Universal Search Command Line's '.memo' command to work. You must have the main 'Universal Search Command Line' patch installed in order for this to take effect. Preware should automatically install USCL if needed. Changelog:
CATEGORY = Universal Search
VERSIONS = 1.3.5-3 1.4.0-23 v1.4.1-1
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/4/47/Universal-search-uscl-memos-patch-1.png\" ]
META_SUB_VERSION = 3

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.patches.universal-search-command-line
include ../modifications.mk

MAINTAINER = dsevil <dse@webonastick.com>
HOMEPAGE = http://webonastick.com/webos/patches/
