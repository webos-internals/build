NAME     = libxml2
TITLE    = libxml2
SRC_VER  = 2.7.2
VERSION  = 2.7.2-1
APP_ID   = org.webosinternals.toolchain.${TITLE}
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png

SRC_TGZ = ftp://xmlsoft.org/libxml2/libxml2-2.7.2.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

include ../../support/package.mk

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
	CC="${CROSS_COMPILE_$*}gcc" LDSHARED="${CROSS_COMPILE_$*}gcc" \
	CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	LDFLAGS="-L${STAGING_DIR_$*}/usr/lib" \
	./configure --prefix=/usr --host=${CONFIGURE_HOST_$*}; \
	${MAKE} clean all)
	mkdir -p build/$*/usr/{lib,include/libxml2/libxml}
	install -m 755 build/src/.libs/*.a build/$*/usr/lib
	install -m 755 build/src/.libs/*.so* build/$*/usr/lib
	install -m 644 build/src/include/libxml/*.h build/$*/usr/include/libxml2/libxml
	touch $@

clobber::
	rm -rf build
