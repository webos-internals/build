NAME     = exampleservice
TITLE    = Example Service
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.1
MAINTAINER = WebOS Internals <support@webos-internals.org>
TYPE	 = Service
CATEGORY = Luna
LICENSE  = GPL v2 Open Source

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

# include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: src/*.c src/*.h
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	cp -rip src build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built build/armv6.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/i686 CC=gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/i686/usr/sbin
	install -m 755 build/src/${NAME} build/i686/usr/sbin
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/armv7 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/armv7/usr/sbin
	install -m 755 build/src/${NAME} build/armv7/usr/sbin
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	( cd build/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/armv7 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/armv6/usr/sbin
	install -m 755 build/src/${NAME} build/armv6/usr/sbin
	touch $@

clobber::
	rm -rf build
