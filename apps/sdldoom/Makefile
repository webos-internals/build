NAME     = sdldoom
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
VERSION  = 1.1.2
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Doom
MAINTAINER = Zsoc <precorder.webosinternals@gmail.com>, Destinal, Rod Whitby
TITLE   = Doom
TYPE	= Application
DESCRIPTION = Port of the popular DOOM! 3-D shooter game written by ID Software.<br>It requires webOS 1.3.5 or later.<br>See the Homepage link below for key bindings and other instructions.
CHANGELOG = 1.1.2: Allow multiple cards to be launched.<br>1.1.1: Added launching capability.<br>1.1.0: Initial release.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/e/eb/Tux_as_Zombie.png
LICENSE  = ID Software License
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/8/85/Doom-instructions.png\",\
\"http://www.webos-internals.org/images/f/f0/Doom-in-a-card.png\" \
 ]

SRC_GIT = git://github.com/wosigh/sdldoom.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/upstart
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/doom build/$*/usr/palm/applications/${APP_ID}/bin/
	install -m 644 build/binaries/doom1.wad build/$*/usr/palm/applications/${APP_ID}/bin/
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
