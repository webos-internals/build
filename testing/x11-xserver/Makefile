NAME     = xorg-server
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
MAXWEBOSVERSION = 2.9.9
VERSION  = 0.2.0
DEPENDS  = org.webosinternals.xlib
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
MAINTAINER = Will Dietz (dtzWill), WebOSInternals
TITLE   = X Window System Server Binaries
TYPE	 = Linux Application
DESCRIPTION = Binaries for the X Window System Server<br>You probably want to install the X Window System Server Application instead of this package.
CHANGELOG = \
0.2.0: Now compatible with webOS 1.4.5 and later.<br>\
0.0.4: Gesture area as control.<br>\
0.0.3: Improve keyboard support, credit to MerlinMM for helping.  See wiki for details.<br>\
0.0.2: First release.
CATEGORY = X Window System
ICON	= http://www.webos-internals.org/images/a/a5/X.png
LICENSE  = MIT/X11 License
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/x11/xserver-pkg.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -f build/src/share/X11/xkb/xkbcomp
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
