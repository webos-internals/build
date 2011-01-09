NAME     = gehrpelcg
TITLE    = GehrPelcg
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.0.1
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:GehrPelcg
ICON	 = http://www.webos-internals.org/images/a/a6/Icon_KlingonKey.png
DESCRIPTION = Gehrpelcg is an implementation of a well-known open source encryption utility.
CHANGELOG = \
0.0.1: Initial release.
SCREENSHOTS = []
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/gehrpelcg.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/binaries/$*/truecrypt build/$*/usr/palm/applications/${APP_ID}/bin/truecrypt
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
