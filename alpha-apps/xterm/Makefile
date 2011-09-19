NAME = xterm
TITLE = XTerm
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.9.1
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
ICON	 = http://www.webos-internals.org/images/a/a5/X.png
MAINTAINER = WebOS Internals
DESCRIPTION = ${APPINFO_DESCRIPTION}
APPINFO_DESCRIPTION = XTerm is used to provide a Linux command-line interface on webOS.<br>\
Due to webOS security constraints, this application cannot run directly.<br>\
You must use <b>Xecutah</b> to run the XTerm and XServer applications on webOS.
CHANGELOG = \
0.9.1: Added multi-card support.<br>\
0.9.0: First public feed release.<br>\
0.7.7: Set default colors to green-on-black, not black-on-black.<br>\
0.7.6: Add ability to change xterm colors via tweaks (thanks to rrix!)<br>\
0.7.2: New upstart-based execution architecture to support legacy webOS versions.<br>\
0.6.6: Initial testing release.
APPINFO_CHANGELOG = [ \
{ "version" : "0.9.1",  "log" : [ "Added multi-card support." ] },\
{ "version" : "0.9.0",  "log" : [ "First public feed release." ] },\
{ "version" : "0.7.7",  "log" : [ "Set default colors to green-on-black, not black-on-black." ] }, \
{ "version" : "0.7.6",  "log" : [ "Add ability to change xterm colors via tweaks (thanks to rrix!)" ] }, \
{ "version" : "0.7.2",  "log" : [ "New upstart-based execution architecture to support legacy webOS versions" ] }, \
{ "version" : "0.6.6",  "log" : [ "Initial testing release" ] } \
]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/x11/xterm.git

include ../../support/download.mk

HEADLESSAPP_VERSION = 0.2.0

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
	tar -C build/src -cf - control upstart icon.png xecutah.sh get_colors.inc | \
	tar -C build/$*/usr/palm/applications/${APP_ID}/ -xf -
	echo "{" > build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"version\": \"${VERSION}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
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
	echo '"uiRevision": "2",' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"noWindow\": true" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json

	mkdir -p build/$*/usr/palm/services/org.webosinternals.tweaks.prefs/preferences
	cp build/src/${APP_ID}.tweaks.json build/$*/usr/palm/services/org.webosinternals.tweaks.prefs/preferences
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
