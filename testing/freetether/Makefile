NAME     = freetether
TITLE    = freeTether
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.99.4
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:FreeTether
ICON	 = http://www.webos-internals.org/images/8/84/Icon_FreeTether.png
DESCRIPTION = freeTether is an application that allows you to share your cellular internet connection with other devices connected via USB, Bluetooth, or WiFi.
CHANGELOG = \
0.99.4: First testing release.
SCREENSHOTS = [\
\"\", \
\"\", \
\"\" \
 ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/freetether.git

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
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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
