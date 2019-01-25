NAME     = sdlquake
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.3.0
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Quake
MAINTAINER = WebOS Internals <http://www.webos-internals.org>
TITLE   = Quake
TYPE	= Application
DESCRIPTION = Port of the popular Quake 3-D shooter game written by ID Software.<br>It requires webOS 1.3.5 or later.
CHANGELOG = 1.3.0: Converted to PDK framework.<br>1.2.0: Visual control overlay.  Settings/bindings are now saved across executions. Misc bugfixes.<br>1.1.0: Increased performance, Drastic improvements to control scheme (including virtual joystick, continuous fire, added gesture controls), Modal Keyboard, fix for Segfault Error.<br>1.0.11: Playable game, better performance, fixed crashes, keybindings.<br>1.0.9: Initial release.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/3/3a/Quake-icon3-resized.png
LICENSE  = ID Software License
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/2/26/Quake_Menu.png\",\
\"http://www.webos-internals.org/images/4/4b/Quake_Lava.png\",\
\"http://www.webos-internals.org/images/6/66/Quake_Ogre.png\"\
 ]

SRC_GIT = git://github.com/webos-internals/sdlquake.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/upstart
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	rm -rf build/$*/usr/palm/applications/${APP_ID}/sdlquake*
	install -m 755 build/src/sdlquake.bin build/$*/usr/palm/applications/${APP_ID}/sdlquake
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
