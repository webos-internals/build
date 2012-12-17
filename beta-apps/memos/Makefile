NAME     = memos
TITLE	 = OWO Memos
APP_ID   = org.webosports.app.${NAME}
SIGNER   = org.webosports
VERSION  = 1.0.6
TYPE	 = Application
CATEGORY = Productivity
HOMEPAGE = http://www.webos-ports.org/wiki/Application:Ports
ICON	 = http://www.webos-internals.org/images/8/85/Memos.png
MINWEBOSVERSION = 2.0.0
DESCRIPTION = A complete rewrite of the webOS Memos app in Enyo 2, for OpenWebOS and webOS 2.x or greater.\
CHANGELOG = \
1.0.6: Add 2.x Back Gesture Support, Polish Narrow UI<br>\
1.0.5: Internal repo reorganization<br>\
1.0.4: Add ports-lib header, layout and library updates<br>\
1.0.3: Backend library updates<br>\
1.0.2: More fun with submodules<br>\
1.0.1: Fix errors with submodules<br>\
1.0.0: First public release.

LICENSE  = Apache 2.0 Open Source

SRC_GIT = git://github.com/webOS-ports/org.webosports.app.memos.git 

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

include ../../support/bootplate-deploy.mk

.PHONY: build
build: build/.built-${VERSION}


build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@


build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	echo "{" > build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"version\": \"${VERSION}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"vendor\": \"WebOS Ports\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"vendor_url\": \"${HOMEPAGE}\","  >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"type\": \"web\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"main\": \"index.html\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"icon\": \"icon.png\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo '"uiRevision": "2",' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

clobber::
	rm -rf build
