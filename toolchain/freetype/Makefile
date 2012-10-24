NAME     = freetype
TITLE    = freetype
APP_ID   = org.webosinternals.toolchain.${NAME}
SRC_VER  = 2.3.12
VERSION  = 2.3.12-2
MAINTAINER = WebOS Internals <support@webos-internals.org>

SRC_BZ2 = http://downloads.help.palm.com/opensource/3.0.0/${NAME}-${SRC_VER}.tar.bz2

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/include
	cp -rp build/$*/usr/include/* ../../staging/$*/usr/include/
	mkdir -p ../../staging/$*/usr/lib
	cp -rp build/$*/usr/lib/* ../../staging/$*/usr/lib/
	touch $@

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -j -x -f $<
	mv build/${NAME}-${SRC_VER} build/src
	${MAKE} SRC_FILE=http://downloads.help.palm.com/opensource/3.0.0/${NAME}-${SRC_VER}-patches.tgz \
		LOCAL_FILE=${NAME}-${VERSION}-patches.tgz download
	tar -x -f ${DL_DIR}/${NAME}-${VERSION}-patches.tgz -O \
		fix-configure.patch libtool-tag.patch files/no-hardcode.patch | patch -d build/src -p1
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  CC=${CROSS_COMPILE_$*}gcc \
	  ./configure --host=${CONFIGURE_HOST_$*} --disable-static; \
	  ${MAKE} clean all )
	mkdir -p build/$*/usr/include/freetype2/
	cp -r build/src/include/* build/$*/usr/include/freetype2/
	mkdir -p build/$*/usr/lib
	install -m 755 build/src/objs/.libs/*.so* build/$*/usr/lib/
	touch $@

clobber::
	rm -rf build
