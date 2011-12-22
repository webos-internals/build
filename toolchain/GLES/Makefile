NAME     = GLES
TITLE    = GLES
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
	mkdir -p ../../staging/$*/usr/include/GLES
	cp -rp src/* ../../staging/$*/usr/include/GLES
	touch $@

include ../../support/cross-compile.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	mkdir build
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	touch $@

clobber::
	rm -rf build
