NAME     = diffstat
TITLE    = Diffstat
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
SRC_VER  = 1.45
VERSION  = 1.45-1
HOMEPAGE = http://invisible-island.net/diffstat/
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is simply the Diffstat utility, cross-compiled and packaged up in a form such that it can be used in the installation scripts of other packages.
CHANGELOG = 1.45-1: Fixed operation on the Palm Emulator.
TYPE	 = Linux Application
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = MIT Open Source

SRC_TGZ = ftp://ftp.invisible-island.net/diffstat/diffstat-${SRC_VER}.tgz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${SRC_VER} build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv6.built-${VERSION} build/armv7.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  CC=${CROSS_COMPILE_$*}gcc \
	  ./configure --host=${CONFIGURE_HOST_$*} ; \
	  ${MAKE} clean all )
	mkdir -p build/$*/usr/bin
	install -m 755 build/src/${NAME} build/$*/usr/bin
	touch $@

clobber::
	rm -rf build
