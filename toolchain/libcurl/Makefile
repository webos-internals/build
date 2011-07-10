NAME     = libcurl
TITLE    = libcurl
APP_ID   = org.webosinternals.toolchain.${NAME}
SRC_VER  = 7.21.3
VERSION  = 7.21.3-1
MAINTAINER = WebOS Internals <support@webos-internals.org>

SRC_BZ2 = http://curl.haxx.se/download/curl-${SRC_VER}.tar.bz2

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/include
	cp -rp build/$*/usr/include/curl ../../staging/$*/usr/include/
	mkdir -p ../../staging/$*/usr/lib
	cp -rp build/$*/usr/lib/* ../../staging/$*/usr/lib/
	touch $@

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -j -x -f $<
	mv build/curl-${SRC_VER} build/src
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
	mkdir -p build/$*/usr/include/curl
	install -m 644 build/src/include/curl/*.h build/$*/usr/include/curl/
	mkdir -p build/$*/usr/lib
	install -m 755 build/src/lib/.libs/*.so* build/$*/usr/lib/
	install -m 755 build/src/lib/.libs/*.la build/$*/usr/lib/
	touch $@

clobber::
	rm -rf build
