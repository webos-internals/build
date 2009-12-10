NAME     = mjson
VERSION  = 1.2
HOMEPAGE = https://sourceforge.net/projects/mjson/
LICENSE  = LGPL Open Source

SRC_TGZ = http://downloads.sourceforge.net/${NAME}/${VERSION}/${NAME}-${VERSION}.tar.gz

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build build/armv7 build/armv6 build/i686
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/json-${VERSION} build/src
	touch $@

build/.built-${VERSION}: build/armv7.built build/armv6.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src ; \
	  ./configure --host=arm-none-linux-gnueabi )
	${MAKE} -C build/src clean
	${MAKE} -C build/src DESTDIR=`pwd`/build/i686 install-data
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src ; PATH="${PATH}:`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin" \
	  ./configure --host=arm-none-linux-gnueabi )
	${MAKE} -C build/src clean
	PATH="${PATH}:`pwd`/../../toolchain/cs08q1armel/build/arm-2008q1/bin" \
	${MAKE} -C build/src DESTDIR=`pwd`/build/armv7 install-data
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	( cd build/src ; PATH="${PATH}:`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin" \
	  ./configure --host=arm-none-linux-gnueabi )
	${MAKE} -C build/src clean
	PATH="${PATH}:`pwd`/../../toolchain/cs08q1armel/build/arm-2008q1/bin" \
	${MAKE} -C build/src DESTDIR=`pwd`/build/armv6 install-data
	touch $@

clobber::
	rm -rf build
