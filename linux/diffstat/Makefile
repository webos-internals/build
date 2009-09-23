NAME     = diffstat
TITLE    = Diffstat
APP_ID   = org.webosinternals.${NAME}
VERSION  = 1.45
HOMEPAGE = http://invisible-island.net/diffstat/
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is simply the Diffstat utility, cross-compiled and packaged up in a form such that it can be used in the installation scripts of other packages.
TYPE	 = Linux Application
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = MIT Open Source

SRC_TGZ = ftp://invisible-island.net/diffstat/diffstat-1.45.tgz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv7 build/i686
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-1.45 build/src
	touch $@

.PHONY: build
build: build/.built

build/.built: build/armv7.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src ; ./configure ; ${MAKE} )
	mkdir -p build/i686/usr/bin
	install -m 755 build/src/${NAME} build/i686/usr/bin
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src ; \
	  export PATH=`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin:${PATH} ; \
	  ./configure --host=arm-none-linux-gnueabi; \
	  ${MAKE} )
	mkdir -p build/armv7/usr/bin
	install -m 755 build/src/${NAME} build/armv7/usr/bin
	touch $@

clobber::
	rm -rf build
