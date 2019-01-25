NAME	= speechd
TITLE	= Speech Dispatcher
APP_ID	= org.webosinternals.${NAME}
SERVICE_ID = ${APP_ID}.service
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION	= 0.7.1-14
TYPE    = Linux Daemon
CATEGORY = System Utilities
DEPENDS  = org.webosinternals.locale ca.canucksoftware.js-service-framework
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SpeechDispatcher
ICON     = http://www.webos-internals.org/images/7/7d/SpeechDispatcher.png
DESCRIPTION = This daemon provides speech synthesis. At the moment, it is only used by the Navit application and there is no dedicated application front-end, but a Mojo service and application will be developed in the future.
CHANGELOG = \
	    0.7.1-14: Add JavaScript-service. <br/> \
	    0.7.1-11: Re-enable support for Pixi. <br/> \
	    0.7.1-10: Try to make this work on Pre3. <br/> \
	    0.7.1-6: Add support for sk_SK.utf8.<br/>\
	    0.7.1-5: Fixed issue which prevented proper upgrading.<br/>\
	    0.7.1-4: Upstart script was missing. Fixed.<br/>\
	    0.7.1-3: Try to fix problem when updating.<br/>\
	    0.7.1-2: Add support for Pixi.<br/>\
	    0.7.1-1: Fade music while talking.<br/>\
	    0.7.1: Initial release.
APPINFO_CHANGELOG = [ \
{ "version" : "0.7.1-13", "log" : [ "Add JS service" ] }, \
{ "version" : "0.7.1-11", "log" : [ "Re-enable support for Pixi" ] }, \
{ "version" : "0.7.1-10", "log" : [ "Try to make this work on Pre3" ] }, \
{ "version" : "0.7.1-6", "log" : [ "Add support for sk_SK.utf8" ] }, \
{ "version" : "0.7.1-5", "log" : [ "Fixed issue which prevented proper upgrading" ] }, \
{ "version" : "0.7.1-4", "log" : [ "Upstart script was missing. Fixed" ] }, \
{ "version" : "0.7.1-3", "log" : [ "Try to fix problem when updating" ] }, \
{ "version" : "0.7.1-2", "log" : [ "Add support for Pixi" ] }, \
{ "version" : "0.7.1-1", "log" : [ "Fade music while talking" ] }, \
{ "version" : "0.7.1", "log" : [ "Initial public release" ] }, \
]
DEPENDS = org.webosinternals.locale
MINWEBOSVERSION = 1.4.5

HEADLESSAPP_VERSION = 0.1.0

D = build/$*/usr/palm/applications/${APP_ID}
S = build/$*/usr/palm/services/${SERVICE_ID}
P = build/$*/usr/palm/packages/${APP_ID}

SRC_GIT = git://github.com/webos-internals/speechd.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

include ../../support/download.mk

include ../../support/headlessapp.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}
build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION} ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	mkdir -p ${D} ${S} ${P}
	tar -C ${D} -xvf ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	rm -rf ${D}/.git
	echo "{" > ${D}/appinfo.json
	echo "\"title\": \"${TITLE}\"," >> ${D}/appinfo.json
	echo "\"id\": \"${APP_ID}\"," >> ${D}/appinfo.json
	echo "\"version\": \"${VERSION}\"," >> ${D}/appinfo.json
	echo "\"vendor\": \"WebOS Internals\"," >> ${D}/appinfo.json
	echo "\"type\": \"web\"," >> ${D}/appinfo.json
	echo "\"main\": \"index.html\"," >> ${D}/appinfo.json
	echo "\"icon\": \"icon.png\"," >> ${D}/appinfo.json
	echo '"message": "${DESCRIPTION}",' >> ${D}/appinfo.json
ifdef APPINFO_CHANGELOG
	echo '"changeLog": ${APPINFO_CHANGELOG},' >> ${D}/appinfo.json
endif
	echo "\"noWindow\": true," >> ${D}/appinfo.json
	echo "\"uiRevision\": 2" >> ${D}/appinfo.json
	echo "}" >> ${D}/appinfo.json
	#
	echo "{" > ${P}/packageinfo.json
	echo "\"id\": \"${APP_ID}\"," >> ${P}/packageinfo.json
	echo "\"package_format_version\": 2," >> ${P}/packageinfo.json
	echo "\"version\": \"${VERSION}\"," >> ${P}/packageinfo.json
	echo "\"icon\": \"icon.png\"," >> ${P}/packageinfo.json
	echo "\"miniicon\": \"icon.png\"," >> ${P}/packageinfo.json
	echo "\"vendor\": \"WebOS Internals\"," >> ${P}/packageinfo.json
	echo "\"vendorurl\": \"http://org.webos-internals.org\"," >> ${P}/packageinfo.json
	echo "\"app\": \"${APP_ID}\"," >> ${P}/packageinfo.json
	echo "\"services\": [\"${SERVICE_ID}\"]," >> ${P}/packageinfo.json
	echo "}" >> ${P}/packageinfo.json
	cp -R build/src/icon.png build/src/upstart ${D}
	cp -R build/src/icon.png ${P}
	cp -R build/src/all/* build/src/$*/* ${D}
	cp -R build/src/service/* ${S}
	rm -rf ${D}/control
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
