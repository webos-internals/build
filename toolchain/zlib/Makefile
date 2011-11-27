NAME     = zlib
TITLE    = zlib
APP_ID   = org.webosinternals.toolchain.${NAME}
SRC_VER  = 1.2.3
VERSION  = 1.2.3-1
MAINTAINER = WebOS Internals <support@webos-internals.org>

SRC_BZ2 = http://palm.cdnetworks.net/opensource/2.1.2/${NAME}-${SRC_VER}.tar.bz2

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
	${MAKE} SRC_FILE=http://palm.cdnetworks.net/opensource/2.1.2/${NAME}-${SRC_VER}-patches.tgz \
		LOCAL_FILE=${NAME}-${VERSION}-patches.tgz download
	tar -x -f ${DL_DIR}/${NAME}-${VERSION}-patches.tgz -O \
		visibility.patch | patch -d build/src -p1
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  CC=${CROSS_COMPILE_$*}gcc LDSHARED="${CROSS_COMPILE_$*}gcc -shared -Wl,-soname,libz.so.1" \
	  AR="${CROSS_COMPILE_$*}ar rc" RANLIB="${CROSS_COMPILE_$*}ranlib" \
	  ./configure --shared; \
	  ${MAKE} LDFLAGS="-L. libz.1.2.3.so" LIBS=libz.1.2.3.so \
		SHAREDLIB=libz.so SHAREDLIBV=libz.1.2.3.so SHAREDLIBM=libz.1.so \
		clean all )
	mkdir -p build/$*/usr/include
	install -m 644 build/src/zlib.h build/$*/usr/include/
	install -m 644 build/src/zconf.h build/$*/usr/include/
	mkdir -p build/$*/usr/lib
	install -m 755 build/src/libz.so* build/$*/usr/lib/
	touch $@

clobber::
	rm -rf build
