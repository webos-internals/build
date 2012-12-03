NAME     = memos
TITLE	 = memos
APP_ID   = org.webosports.app.${NAME}
SIGNER   = org.webosports
BLDFLAGS = -p
VERSION  = 1.0.0
TYPE	 = Application
CATEGORY = Productivity
HOMEPAGE = http://www.webos-ports.org/wiki/Application:Ports
ICON	 = http://www.webos-internals.org/images/8/85/Memos.png
MINWEBOSVERSION = 3.0.5
DESCRIPTION = An Full re-write of the Memos app for OpenWebOS and webOS 3.0.5.
CHANGELOG = \
<br>1.0.0: First public release.
LICENSE  = GPL v2 Open Source

SRC_GIT = git://github.com/webOS-ports/org.webosports.app.memos.git 

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src/bin build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	touch $@

clobber::
	rm -rf build
