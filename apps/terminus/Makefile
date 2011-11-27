NAME     = terminus
APP_ID   = us.ryanhope.${NAME}
MAXWEBOSVERSION = 2.9.9
SIGNER   = org.webosinternals
VERSION  = 0.0.6
HOMEPAGE = http://git.webos-internals.org/trac/terminus
MAINTAINER = Ryan Hope
TITLE   = Terminus
TYPE	= Application
DESCRIPTION = Linux Terminal

BLDFLAGS = -p

CATEGORY = System Utilities
ICON	 = http://www.webos-internals.org/images/b/bc/Terminus_Icon.png
LICENSE  = GPL

CHANGELOG = \
0.0.6 Fix postinst to work on webos 2.x <br>\
0.0.5 Fixed the slow loading; terminus should now start instantly.

SRC_GIT = git://git.webos-internals.org/applications/terminus.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/data
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/terminus build/$*/usr/palm/applications/${APP_ID}/bin/
	cp -r build/src/src/data/*.png build/$*/usr/palm/applications/${APP_ID}/data/
	cp -r build/src/src/data/*.ttf build/$*/usr/palm/applications/${APP_ID}/data/
	cp -r build/binaries/$*/deps build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
