NAME     = xterm-launcher
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
MAXWEBOSVERSION = 2.9.9
VERSION  = 0.2.0
DEPENDS  = org.webosinternals.xterm-bin, org.webosinternals.xorg-server
HOMEPAGE = http://www.webos-internals.org/wiki/Application:X
MAINTAINER = Will Dietz (dtzWill), WebOSInternals
TITLE   = XTerm
TYPE	 = Application
DESCRIPTION = Launcher for the X Window System Terminal Application
CHANGELOG = \
0.2.0: Now compatible with webOS 1.4.5 and later.<br>\
0.0.5: Use login shell to get proper env.<br>\
0.0.3: First release.
CATEGORY = System Utilities
ICON	= http://www.webos-internals.org/images/a/a5/X.png
LICENSE  = MIT/X11 License
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/x11/${NAME}.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	cp build/src/${APP_ID}.tweaks.json build/$*/usr/palm/services/org.webosinternals.tweaks.prefs/
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build
