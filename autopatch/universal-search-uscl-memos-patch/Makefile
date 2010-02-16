NAME = $(shell basename $(shell pwd))
PATCH = universal-search/${NAME}.patch
TITLE = USCL Memos Patch
DESCRIPTION = This will allow the Universal Search Command Line's '.memo' command to work. You must have the main 'Universal Search Command Line' patch installed in order for this to take effect. Preware should automatically install USCL if needed. Changelog:<br />2009-12-06: Fixed bug with '.note' and '.quicknote'.<br />2009-12-03: Fixed to work better with USCL's new .quicknote feature<br/>2009-11-18: webOS 1.3.1 compatible.<br />2009-11-12: New notes created via USCL have timestamps appended
CATEGORY = Universal Search
VERSIONS = 1.2.1-20 1.3.1-24 1.3.5-3
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [\"http://www.webos-internals.org/images/4/47/Universal-search-uscl-memos-patch-1.png\"]
META_SUB_VERSION = 3

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.patches.universal-search-command-line
include ../modifications.mk

MAINTAINER = dsevil <dse@webonastick.com>
HOMEPAGE = http://webonastick.com/webos/patches/
