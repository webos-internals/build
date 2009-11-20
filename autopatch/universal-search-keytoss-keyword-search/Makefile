NAME = $(shell basename $(shell pwd))
PATCH = universal-search/${NAME}.patch
TITLE = KeyToss Keyword Search
DESCRIPTION = This will install KeyToss keyword-powered search tool to Universal Search and to the browser URL search. Type 'k list' for a list of keywords.
CATEGORY = Universal Search
VERSIONS = 1.2.1-0 1.3.1-14
ICON = http://www.webos-internals.org/images/b/bc/Icon_universal-search-keytoss-keyword-search.png
SCREENSHOTS = [\"http://www.webos-internals.org/images/4/4f/Universal-search-keytoss-keyword-search-1.jpg\",\"http://www.webos-internals.org/images/2/2a/Universal-search-keytoss-keyword-search-2.jpg\"]
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 build/src-${VERSION}/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *.png build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *_extra build/all/usr/palm/applications/${APP_ID}/
	touch $@

MAINTAINER = Sam Kim <info@keytoss.com>
HOMEPAGE = http://keytoss.com/pre
