NAME     = libdaemon
TITLE    = libdaemon
SRC_VER  = 0.14
VERSION  = 0.14-1
APP_ID   = org.webosinternals.${TITLE}
HOMEPAGE = http://0pointer.de/lennart/projects/libdaemon
MAINTAINER = Will Rea <will.rea@gmail.com>
DESCRIPTION = Lightweight C library that eases the writing of UNIX daemons
TYPE	 = Linux Library
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = LGPL v2.1 Open Source

SRC_TGZ = http://0pointer.de/lennart/projects/libdaemon/libdaemon-${SRC_VER}.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

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

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src ; \
	CC=${CROSS_COMPILE_$*}gcc;\
	CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	LDFLAGS="-L${STAGING_DIR_$*}/usr/lib" \
	./configure --prefix=/usr --disable-lynx --host=${CONFIGURE_HOST_$*}; \
	${MAKE} clean all)

	mkdir -p build/$*/usr/palm/applications/${APP_ID}/lib
	install -m 755 build/src/libdaemon/.libs/{*.so*,*.a} build/$*/usr/palm/applications/${APP_ID}/lib
	touch $@

clobber::
	rm -rf build
