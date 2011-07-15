NAME = xserver
TITLE = XServer
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.6.7
MINWEBOSVERSION = 2.0.0
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
MAINTAINER = WebOS Internals
DESCRIPTION = ${APPINFO_DESCRIPTION}
APPINFO_DESCRIPTION = XServer is used to display X Windows applications on webOS.<br>\
Due to webOS security constraints, this application cannot run directly.<br>\
You must use <b>Xecutah</b> to run the XServer and other X Window System applications on webOS.
CHANGELOG = \
0.6.7: Force phones to portrait mode.<br>\
0.6.6: Initial testing release.
APPINFO_CHANGELOG = [ \
{ "version" : "0.6.7",  "log" : [ "Force phones to portrait mode" ] }, \
{ "version" : "0.6.6",  "log" : [ "Initial testing release" ] } \
]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/x11/xlauncher.git

include ../../support/download.mk

HEADLESSAPP_VERSION = 0.1.0

include ../../support/headlessapp.mk

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -f build/src/*/share/X11/xkb/xkbcomp
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION} ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	tar -C build/$*/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf build/$*/usr/palm/applications/${APP_ID}/.git
	tar -C build/src/$* -cf - . | \
	tar -C build/$*/usr/palm/applications/${APP_ID}/ -xf -
	tar -C build/src -cf - icon.png xecutah.sh set_keymap_later.sh | \
	tar -C build/$*/usr/palm/applications/${APP_ID}/ -xf -
	echo "{" > build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"version\": \"${WEBOS_VERSION}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"vendor\": \"WebOS Internals\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"type\": \"web\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"main\": \"index.html\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"icon\": \"icon.png\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
ifdef APPINFO_DESCRIPTION
	echo '"message": "${APPINFO_DESCRIPTION}",' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
endif
ifdef APPINFO_CHANGELOG
	echo '"changeLog": ${APPINFO_CHANGELOG},' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
endif
	echo "\"noWindow\": true" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

clobber::
	rm -rf build
