NAME = xserver
TITLE = XServer
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.9.7
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
ICON	 = http://www.webos-internals.org/images/a/a5/X.png
MAINTAINER = WebOS Internals
DESCRIPTION = ${APPINFO_DESCRIPTION}
APPINFO_DESCRIPTION = XServer is used to display X Windows applications on webOS.<br>\
Due to webOS security constraints, this application cannot run directly.<br>\
You must use <b>Xecutah</b> to run the XServer and other X Window System applications on webOS.
CHANGELOG = \
0.9.7: Add support for right-click as well as show/hide keyboard.  Code primarily from elpollodiablo!<br> \
0.9.6: Fix Orientation and Tab char support in 3.0.4. Also, add vkb support for control (dismiss) and escape (euro).<br> \
0.9.4: Use Meta_L instead of Alt_L for compat.<br> \
0.9.3: Added support for starting multiple applications in separate cards.<br>\
0.9.2: Move to an event based start.<br>\
0.9.1: Added multi-card support.<br>\
0.9.0: First public feed release.<br>\
0.8.4: Works again on Pre.<br>\
0.8.3: Fix rendering regression (see hex-a-hop) introduced in previous release.<br>\
0.8.2: Use 32bpp instead of 24bpp, fixes crashes with lxterminal and others.<br>\
0.8.1: Add basic RANDR support, fix some keyboard issues.<br>\
0.7.6: Add support for bluetooth Control, Alt, and arrow keys. (Alt is 'Symbol' on HP BT keyboard).<br>\
0.7.5: Fix timing issue that sometimes results in keymappings not being set.<br>\
0.7.4: Add support to change virtual keyboard type (size, or none) with tweaks.<br>\
0.7.3: Greatly improved support for touchpad virtual keyboard.<br>\
0.7.2: New upstart-based execution architecture to support legacy webOS versions.<br>\
0.6.8: Enable sticky modifiers on phone devices.<br>\
0.6.7: Force phones to portrait mode.<br>\
0.6.6: Initial testing release.
APPINFO_CHANGELOG = [ \
{ "version" : "0.9.7",  "log" : [ "Add support for right-click as well as show/hide keyboard.  Code primarily from elpollodiablo!" ] },\
{ "version" : "0.9.6",  "log" : [ "Fix Orientation and Tab char support in 3.0.4. Also, add vkb support for control (dismiss) and escape (euro)." ] },\
{ "version" : "0.9.4",  "log" : [ "Use Meta_L instead of Alt_L for compat." ] },\
{ "version" : "0.9.3",  "log" : [ "Added support for starting multiple applications in separate cards." ] },\
{ "version" : "0.9.2",  "log" : [ "Move to an event based start." ] },\
{ "version" : "0.9.1",  "log" : [ "Added multi-card support." ] },\
{ "version" : "0.9.0",  "log" : [ "First public feed release." ] },\
{ "version" : "0.8.4",  "log" : [ "Works again on Pre." ] },\
{ "version" : "0.8.3",  "log" : [ "Fix rendering regression (see hex-a-hop) introduced in previous release." ] },\
{ "version" : "0.8.2",  "log" : [ "Use 32bpp instead of 24bpp, fixes crashes with lxterminal and others." ] },\
{ "version" : "0.8.1",  "log" : [ "Add basic RANDR support, fix some keyboard issues." ] },\
{ "version" : "0.7.6",  "log" : [ "Add support for bluetooth Control, Alt, and arrow keys. (Alt is 'Symbol' on HP BT keyboard)." ] },\
{ "version" : "0.7.5",  "log" : [ "Fix timing issue that sometimes results in keymappings not being set." ] },\
{ "version" : "0.7.4",  "log" : [ "Add support to change virtual keyboard type (size, or none) with tweaks." ] }, \
{ "version" : "0.7.3",  "log" : [ "Greatly improved support for touchpad virtual keyboard" ] }, \
{ "version" : "0.7.2",  "log" : [ "New upstart-based execution architecture to support legacy webOS versions" ] }, \
{ "version" : "0.6.8",  "log" : [ "Enable sticky modifiers on phone devices" ] }, \
{ "version" : "0.6.7",  "log" : [ "Force phones to portrait mode" ] }, \
{ "version" : "0.6.6",  "log" : [ "Initial testing release" ] } \
]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://github.com/webos-internals/xserver.git

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
	tar -C build/src -cf - control upstart icon.png xecutah.sh set_keymap.sh | \
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
