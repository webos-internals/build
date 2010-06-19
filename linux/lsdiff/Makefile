NAME     = lsdiff
TITLE    = Lsdiff
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
SRC_VER  = 0.3.1
VERSION  = 0.3.1-1
HOMEPAGE = http://cyberelk.net/tim/software/patchutils/
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is simply the lsdiff utility from the patchutils package, cross-compiled and packaged up in a form such that it can be used in the installation scripts of other packages.
CHANGELOG = 0.3.1-1: Fixed operation on the Palm Emulator.
TYPE	 = Linux Application
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = MIT Open Source

SRC_BZ2 = http://cyberelk.net/tim/data/patchutils/stable/patchutils-${SRC_VER}.tar.bz2

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -jxf ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	mv build/patchutils-${SRC_VER} build/src
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
	install -m 755 build/src/src/filterdiff build/$*/usr/bin/${NAME}
	touch $@

clobber::
	rm -rf build
