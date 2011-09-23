NAME     = xapp-xchat
TITLE    = Xchat-Xapp
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.0.2
TYPE     = Linux Application
CATEGORY = Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/UbuntuChroot
ICON     = http://www.webos-internals.org/images/5/5e/Icon_WebOSInternals_Ubuntu.png
DESCRIPTION = ${APPINFO_DESCRIPTION}
APPINFO_DESCRIPTION = A Xapp to Launch Xchat. Requires Ubuntu-Natty-Chroot.
CHANGELOG = \
0.0.1-1: Initial test.
APPINFO_CHANGELOG = [ \
{ "version" : "0.0.1-1",  "log" : [ "Initial test" ] } \
]
SCREENSHOTS = [\
 ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git@git.webos-internals.org:x11/xapps.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
#	( cd build/src/c-service ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
#	install -m 755 build/src/c-service/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
#	install -m 644 icon.png build/$*/usr/palm/applications/${APP_ID}/icon.png
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
#	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
#	install -m 755 bin/*.sh build/$*/usr/palm/applications/${APP_ID}/bin/
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
	echo "\"noWindow\": true" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	echo "}" >> build/$*/usr/palm/applications/${APP_ID}/appinfo.json

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
