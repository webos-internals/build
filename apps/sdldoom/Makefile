NAME     = sdldoom
APP_ID   = org.webosinternals.${NAME}
VERSION  = 1.1.0
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Doom
MAINTAINER = Zsoc <precorder.webosinternals@gmail.com>, Destinal, Rod Whitby
TITLE   = Doom
TYPE	= Application
DESCRIPTION = Port of the popular DOOM! 3-D shooter game written by ID Software.<br>It required webOS 1.3.5 or later.<br>See the Homepage link below for key bindings and other instructions.
CHANGELOG = 1.1.0: Initial release.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/e/eb/Tux_as_Zombie.png
LICENSE  = ID Software License
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/8/85/Doom-instructions.png\",\
\"http://www.webos-internals.org/images/f/f0/Doom-in-a-card.png\" \
 ]

SRC_GIT = git://git.webos-internals.org/games/sdldoom.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION}: build/armv6.built-${VERSION} build/armv7.built-${VERSION}
	touch $@

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

build/.built-${VERSION}: build/armv6.built-${VERSION} build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	install -m 755 build/binaries/$*/doom build/$*/usr/palm/applications/${APP_ID}/
	install -m 644 build/binaries/doom1.wad build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
