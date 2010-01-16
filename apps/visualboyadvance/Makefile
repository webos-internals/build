NAME     = visualboyadvance
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.0.3
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:VBA
MAINTAINER = dtzWill
TITLE   = VisualBoyAdvance
TYPE	= Application
DESCRIPTION = Port of the popular Game Boy, Game Boy Color, and Game Boy Advance emulator.<br>Official wiki <a href="http://www.webos-internals.org/wiki/Application:VBA">here</a> (Please read it!).<br>If you like this game, please consider donating!  See wiki for link.
CHANGELOG = 1.0.3 Added toggle for displaying emulation speed to help compatability reports<br>1.0.2 Small metadata fix. <br>1.0.1 Small performance boost, public release!<br>1.0.0 Initial release.  Reimplemented rendering engine, rom selector.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/3/3c/Vba.png
LICENSE  = GPLv2
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/games/visualboyadvance.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/upstart
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/vba build/$*/usr/palm/applications/${APP_ID}/bin/
	mkdir -p build/$*/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
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

.PHONY: clobber
clobber::
	rm -rf build
