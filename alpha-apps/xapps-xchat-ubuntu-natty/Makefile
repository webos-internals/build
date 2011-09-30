NAME     = xapps-xchat-ubuntu-natty
TITLE    = XApps-XChat-Ubuntu-Natty
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.5.15
TYPE	 = Linux Application
CATEGORY = Communications
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Xapps
ICON	 = http://www.webos-internals.org/images/3/3e/Icon_XChat_X_Ubuntu.png
DESCRIPTION = ${APPINFO_DESCRIPTION}
APPINFO_DESCRIPTION = A XApp to launch XChat. Requires Ubuntu-Natty-Chroot.
CHANGELOG = \
0.5.15: Major Cleanup of prem and Postinst<br>\
0.5.7: leave app in chroot alone, just disconnect from webOS<br> \
0.5.4: removed need for shim, prerm is broken<br> \
0.4: removed unnecessary bits<br> \
0.3: added extra ../ to includes<br>\
0.2: Fixed names and paths<br>\
0.1-1: Initial test.<br>\

APPINFO_CHANGELOG = [ \
{ "version" : "0.5.15", "log" : [ "major cleanup of prerm and postinst" ] }\
{ "version" : "0.5.4",  "log" : [ "first Alpha release" ] }\
{ "version" : "0.1-1",  "log" : [ "Initial test" ] }\
]

SCREENSHOTS = [\
 ]
LICENSE  = GPL v2 Open Source


include ../../support/download.mk

HEADLESSAPP_VERSION = 0.2.0

include ../../support/headlessapp.mk

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk 
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}


.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} 
	touch $@

#include ../../support/cross-compile.mk

build/%.built-${VERSION}:   ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	tar -C build/$*/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf build/$*/usr/palm/applications/${APP_ID}/.git
	install -m 644 icon.png build/$*/usr/palm/applications/${APP_ID}/icon.png
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 control/* build/$*/usr/palm/applications/${APP_ID}/control/
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 bin/*.sh build/$*/usr/palm/applications/${APP_ID}/bin/
	echo "{" > build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"version\": \"${VERSION}\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"vendor\": \"WebOS Internals\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"type\": \"web\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"main\": \"index.html\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"icon\": \"icon.png\"," >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
#ifdef APPINFO_DESCRIPTION
#	echo '"message": "${APPINFO_DESCRIPTION}",' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
#endif
#ifdef APPINFO_CHANGELOG
#	echo '"changeLog": ${APPINFO_CHANGELOG},' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
#endif
	echo '"uiRevision": "2",' >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "\"noWindow\": true" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	touch $@

clobber::
	rm -rf build
