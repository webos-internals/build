NAME     = homecontrol
TITLE    = Home Control
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.7.0
TYPE	 = Application
CATEGORY = Utilities
HOMEPAGE = http://forums.precentral.net/enlightened-linux-solutions/305887-app-home-control.html
ICON	 = http://www.webos-internals.org/images/8/82/Icon_Home-Control.png
DESCRIPTION = Home Control a universal remote control application.<br><br>NOTE: This app nees a server application as well which you can find here: http://wee.e-lnx.org/homecontrol/.
MINWEBOSVERSION = 2.1.0
MAXWEBOSVERSION = 3.9.9
CHANGELOG = \
0.7.0: Again added new features and cleaned up the code.<br>\
0.6.0: Added lots of new features.<br>\
0.5.1: Fixed the beta release.<br>\
0.5.0: Initial beta release.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/f/fa/Home_control.png\" ]

LICENSE  = BSD Open Source License

SRC_GIT = git://git.webos-internals.org/applications/homecontrol.git

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
	rm -rf build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/enyo-app/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/package
	touch $@

clobber::
	rm -rf build
