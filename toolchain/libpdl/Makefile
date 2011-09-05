NAME     = libpdl
TITLE    = libpdl
APP_ID   = org.webosinternals.toolchain.${NAME}
VERSION  = 1.0
MAINTAINER = WebOS Internals <support@webos-internals.org>

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

include ../../support/cross-compile.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	cp -rip src build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  ${MAKE} CC=${CROSS_COMPILE_$*}gcc clobber ${NAME}.so )
	mkdir -p build/$*/usr/include/
	install -m 644 build/src/PDL.h build/$*/usr/include/
	mkdir -p build/$*/usr/lib
	install -m 755 build/src/libpdl.so build/$*/usr/lib/
	touch $@

clobber::
	rm -rf build
