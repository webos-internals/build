NAME     = tide
TITLE    = TouchPad IDE
APP_ID   = us.ryanhope.${NAME}
SRV_ID   = us.ryanhope.${NAME}.fileio
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.0.17
TYPE	 = Application
CATEGORY = Development
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Tide
ICON	 = http://www.webos-internals.org/images/0/02/Icon-64.png
DESCRIPTION = A code editor (and soon more) for your TouchPad.
MINWEBOSVERSION = 3.0.0

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/14/Tide_2011-31-07_141616.png\" ]

LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/enyo/editah.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	cd build/src; git submodule update --init --recursive
	#rm -rf build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/enjo-app/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/services/${SRV_ID}
	cp -r build/src/node-service/* build/$*/usr/palm/services/${SRV_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/node-service
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/package
	touch $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
