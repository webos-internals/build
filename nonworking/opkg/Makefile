NAME     = opkg
TITLE    = opkg
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.1.8
HOMEPAGE = http://opkg.googlecode.com
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = Opkg is a lightweight package management system based on Ipkg.
TYPE	 = Linux Application
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = GPL v2 Open Source

SRC_TGZ = http://opkg.googlecode.com/files/${NAME}-${VERSION}.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_i686.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${VERSION} build/src
	sed -i.orig -e 's|DEST_NAME "root"|DEST_NAME "apps"|' \
		    -e 's|DEST_ROOT_DIR "/"|DEST_ROOT_DIR "/media/cryptofs/apps"|' \
		build/src/libopkg/opkg_conf.h
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/i686.built build/armv7.built build/armv6.built
	touch $@

OPKG_CONFIGURE_ARGS = --disable-shared --disable-gpg --disable-curl \
	--with-opkglibdir=/media/cryptofs/apps/usr/lib \
	--with-opkgetcdir=/media/cryptofs/apps/etc

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src ; \
	  export PATH=`pwd`/../../../../toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/bin:${PATH} ; \
	  ./configure --host=i686-unknown-linux-gnu ${OPKG_CONFIGURE_ARGS} ; \
	  ${MAKE} )
	mkdir -p build/i686/usr/bin
	install -m 755 build/src/src/${NAME}-cl build/i686/usr/bin/${NAME}
	( cd build/src ; ${MAKE} clean )
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src ; \
	  export PATH=`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin:${PATH} ; \
	  ./configure --host=arm-none-linux-gnueabi ${OPKG_CONFIGURE_ARGS} ; \
	  ${MAKE} )
	mkdir -p build/armv7/usr/bin
	install -m 755 build/src/src/${NAME}-cl build/armv7/usr/bin/${NAME}
	( cd build/src ; ${MAKE} clean )
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	( cd build/src ; \
	  export PATH=`pwd`/../../../../toolchain/cs08q1armel/build/arm-2008q1/bin:${PATH} ; \
	  ./configure --host=arm-none-linux-gnueabi ${OPKG_CONFIGURE_ARGS} ; \
	  ${MAKE} )
	mkdir -p build/armv6/usr/bin
	install -m 755 build/src/src/${NAME}-cl build/armv6/usr/bin/${NAME}
	( cd build/src ; ${MAKE} clean )
	touch $@

clobber::
	rm -rf build
