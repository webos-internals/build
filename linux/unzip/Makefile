NAME     = unzip
TITLE    = UnZip
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
SRC_VER  = 6.0
VERSION  = 6.0-1
HOMEPAGE = http://www.info-zip.org/
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is simply the UnZip utility, cross-compiled and packaged up in a form such that it can be used in the installation scripts of other packages.
CHANGELOG = 6.0-1: First public release.
TYPE	 = Linux Application
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/d/d9/Icon_WebOSInternals_ZLib.png
LICENSE  = GPL v2 Open Source

SRC_TGZ = http://ftp.debian.org/debian/pool/main/u/unzip/unzip_${SRC_VER}.orig.tar.gz

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
	mv build/unzip60 build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  ${MAKE} -f unix/Makefile clean generic CC=${CROSS_COMPILE_$*}gcc )
	mkdir -p build/$*/usr/bin
	install -m 755 build/src/${NAME} build/$*/usr/bin
	touch $@

clobber::
	rm -rf build
