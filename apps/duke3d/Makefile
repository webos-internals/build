NAME     = duke3d
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
VERSION  = 1.0.10
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Duke3D
MAINTAINER = Henk Jonas
TITLE   = Duke3D
TYPE	= Application
DESCRIPTION = Port of the popular Duke Nukem 3D shooter game written by 3DRealms.<br>It requires webOS 1.3.5 or later.<br>\
This port is based on the desktop port from JonoF (http://www.jonof.id.au).<br>You will need files from the Duke Nukem 3D \
desktop version, either demo or full. Start the game once on your WebOS device and it will create a Duke3D folder on your internal \
USB drive. Read the readme file which should be there for further infos.<br>To get music work, copy timidity patches into \
the timidity folder on your internal drive. Please read the readme.txt about it.
CHANGELOG = 1.0.10: find the how-to for music in the readme, sound still not perfect
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/0/03/Duke3d_icon.png
LICENSE  = GNU License
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b1/Duke3d_game1.png\",\
\"http://www.webos-internals.org/images/b/b1/Duke3d_menu.png\",\
\"http://www.webos-internals.org/images/b/b1/Duke3d_title.png\",\
\"http://www.webos-internals.org/images/b/b1/Duke3d_game2.png\"\
 ]

SRC_GIT = git://git.webos-internals.org/games/duke3d.git

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
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/duke3d build/$*/usr/palm/applications/${APP_ID}/bin/
	chmod ugao+x build/$*/usr/palm/applications/${APP_ID}/start
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
