NAME	= speechd
TITLE	= speech-dispatcher
APP_ID	= org.webosinternals.${NAME}
VERSION	= 0.7-1
TYPE    = Linux Daemon
CATEGORY = System Utilities
DESCRIPTION = This daemon provides speech synthesis.
CHANGELOG = 0.7-1: Initial release
DEPENDS = org.webosinternals.locale

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/applications/speechd.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}
build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p ${D}
	cp -r build/src/binaries/* ${D}
	touch $@

clobber::
	rm -rf build
