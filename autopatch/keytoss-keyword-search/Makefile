NAME = keytoss-keyword-search
PATCH = /luna/${NAME}.patch
TITLE = KeyToss Keyword Search
DESCRIPTION = This will install KeyToss keyword-powered search tool to Universal Search and to the browser URL search. Search the internet for keytoss keyword-powered search use.
CATEGORY = Luna
VERSION = 0.4.0
ICON = 
SCREENSHOTS = 

include ../common.mk
include ../modifications.mk

build/.built: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 build/src/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *.png build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *_extra build/all/usr/palm/applications/${APP_ID}/
	touch $@
