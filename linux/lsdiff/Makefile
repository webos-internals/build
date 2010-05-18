NAME     = lsdiff
TITLE    = Lsdiff
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.3.1
HOMEPAGE = http://cyberelk.net/tim/software/patchutils/
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = This package is simply the lsdiff utility from the patchutils package, cross-compiled and packaged up in a form such that it can be used in the installation scripts of other packages.
TYPE	 = Linux Application
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = MIT Open Source

SRC_BZ2 = http://cyberelk.net/tim/data/patchutils/stable/patchutils-${VERSION}.tar.bz2

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -jxf ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	mv build/patchutils-${VERSION} build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv6.built build/armv7.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src ; ./configure ; ${MAKE} )
	mkdir -p build/i686/usr/bin
	install -m 755 build/src/src/filterdiff build/i686/usr/bin/lsdiff
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	( cd build/src ; \
	  export PATH=`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin:${PATH} ; \
	  ./configure --host=arm-none-linux-gnueabi; \
	  ${MAKE} )
	mkdir -p build/armv6/usr/bin
	install -m 755 build/src/src/filterdiff build/armv6/usr/bin/lsdiff
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src ; \
	  export PATH=`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin:${PATH} ; \
	  ./configure --host=arm-none-linux-gnueabi; \
	  ${MAKE} )
	mkdir -p build/armv7/usr/bin
	install -m 755 build/src/src/filterdiff build/armv7/usr/bin/lsdiff
	touch $@

clobber::
	rm -rf build
