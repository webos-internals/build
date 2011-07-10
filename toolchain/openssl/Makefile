NAME     = openssl
TITLE    = OpenSSL
APP_ID   = org.webosinternals.toolchain.${NAME}
SRC_VER  = 0.9.8k
VERSION  = 0.9.8.11-1
MAINTAINER = WebOS Internals <support@webos-internals.org>

SRC_TGZ = http://www.openssl.org/source/openssl-${SRC_VER}.tar.gz

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/include/openssl
	cp -rp build/$*/usr/include/openssl/* ../../staging/$*/usr/include/openssl/
	cp -rp build/$*/usr/lib/* ../../staging/$*/usr/lib/
	touch $@

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

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  CC=${CROSS_COMPILE_$*}gcc \
	  ./Configure shared no-zlib no-asm linux-elf; \
	  ${MAKE} \
		AR="${CROSS_COMPILE_$*}ar r" RANLIB=${CROSS_COMPILE_$*}ranlib \
		clean all )
	mkdir -p build/$*/usr/include/openssl
	install -m 644 build/src/include/${NAME}/* build/$*/usr/include/openssl/
	mkdir -p build/$*/usr/lib
	install -m 755 build/src/*.so* build/$*/usr/lib/
	install -m 755 build/src/*.a build/$*/usr/lib/
	touch $@

clobber::
	rm -rf build
