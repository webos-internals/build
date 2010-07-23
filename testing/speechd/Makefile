NAME	= speechd
TITLE	= Speech Dispatcher
APP_ID	= org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION	= 0.7.1-1
TYPE    = Linux Daemon
CATEGORY = System Utilities
DEPENDS  = org.webosinternals.locale
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SpeechDispatcher
ICON     = http://www.webos-internals.org/images/7/7d/SpeechDispatcher.png
DESCRIPTION = This daemon provides speech synthesis.  At the moment, it is only used by the Navit application and there is no dedicated application front-end, but a Mojo service and application will be developed in the future.
CHANGELOG = \
	    0.7.1-1: Fade music while talking.<br>\
	    0.7.1: Initial release.
APPINFO_CHANGELOG = [ \
{ "version" : "0.7.1", "log" : [ "Initial public release" ] }, \
{ "version" : "0.7.1-1", "log" : [ "Fade music while talking" ] }, \
]
DEPENDS = org.webosinternals.locale

HEADLESSAPP_VERSION = 0.1.0

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/services/speechd.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
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
build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION} ${DL_DIR}/headlessapp-${HEADLESSAPP_VERSION}.tar.gz
	mkdir -p ${D}
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
	echo "\"noWindow\": true" >> ${D}/appinfo.json
	echo "}" >> ${D}/appinfo.json
	cp -r build/src/* ${D}
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
