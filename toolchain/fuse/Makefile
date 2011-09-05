NAME     = fuse
TITLE    = fuse
APP_ID   = org.webosinternals.toolchain.${NAME}
SRC_VER  = 2.7.2
VERSION  = 2.7.2
MAINTAINER = WebOS Internals <support@webos-internals.org>

SRC_TGZ = http://downloads.sourceforge.net/project/${NAME}/${NAME}-2.X/${VERSION}/${NAME}-${VERSION}.tar.gz

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

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -z -x -f $<
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
	  CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	  LDFLAGS="-Wl,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	  ./configure \
	  	--host=${CONFIGURE_HOST_$*} \
		--prefix=${STAGING_DIR_$*}/usr \
		--exec-prefix=${STAGING_DIR_$*}/usr; \
	  ${MAKE} clean all )
	mkdir -p build/$*/usr/include/fuse
	install -m 644 build/src/include/*.h build/$*/usr/include/fuse/
	mkdir -p build/$*/usr/lib
	install -m 755 build/src/lib/*.la build/$*/usr/lib/
	install -m 755 build/src/lib/.libs/*.so* build/$*/usr/lib/
	mkdir -p build/$*/usr/lib/pkgconfig
	install -m 644 build/src/*.pc build/$*/usr/lib/pkgconfig/
	touch $@

clobber::
	rm -rf build
