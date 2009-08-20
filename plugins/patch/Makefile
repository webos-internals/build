NAME     = patch
APP_ID   = org.webosinternals.${NAME}
VERSION  = 2.5.9
HOMEPAGE = http://www.preware.org/wiki/Application:Patch
MAINTAINER = WebOS Internals <support@webos-internal.org>
DESCRIPTION = Preware Patch Utility
SECTION = Services and Plugins

SRC_TGZ = http://ftp.debian.org/debian/pool/main/p/patch/patch_$(VERSION).orig.tar.gz
include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv7 build/i686
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${VERSION} build/src
	touch $@

.PHONY: build
build: build/.built

build/.built: build/armv7.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src ; ./configure ; ${MAKE} )
	mkdir -p build/i686/usr/bin
	install -m 644 build/src/${NAME} build/i686/usr/bin
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src ; \
	  export PATH=`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin:${PATH} ; \
	  ./configure --host=arm-none-linux-gnueabi; \
	  ${MAKE} )
	mkdir -p build/armv7/usr/bin
	install -m 644 build/src/${NAME} build/armv7/usr/bin
	touch $@

include ../../support/plugin-package.mk

clobber::
	rm -rf build
