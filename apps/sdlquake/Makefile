NAME     = sdlquake
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.0.10
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Quake
MAINTAINER = dtzWill, Rod Whitby
TITLE   = Quake
TYPE	= Application
DESCRIPTION = Port of the popular Quake 3-D shooter game written by ID Software.<br>It requires webOS 1.3.5 or later.
CHANGELOG = 1.0.10: Playable game, better performance, fixed crashes, keybindings.<br>1.0.9: Initial release.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/e/eb/Tux_as_Zombie.png
LICENSE  = ID Software License
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/8/85/Quake-instructions.png\",\
\"http://www.webos-internals.org/images/f/f0/Quake-in-a-card.png\" \
 ]

SRC_GIT = git://git.webos-internals.org/games/sdlquake.git

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
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin/id1
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/upstart
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/quake build/$*/usr/palm/applications/${APP_ID}/bin/
	install -m 644 build/binaries/id1/pak0.pak build/$*/usr/palm/applications/${APP_ID}/bin/id1/
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
