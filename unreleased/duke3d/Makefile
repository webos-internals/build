NAME     = duke3d
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.0.5
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Duke3D
MAINTAINER = Henk Jonas
TITLE   = Duke3D
TYPE	= Application
DESCRIPTION = Port of the popular Duke Nukem 3D shooter game written by 3DRealms.<br>It requires webOS 1.3.5 or later.<br>\
This port is based on the desktop port from JonoF (http://www.jonof.id.au).<br>You will need files from the Duke Nukem 3D \
desktop version, either demo or full. Start the game once on your WebOS device and it will create a Duke3D folder on your internal \
USB drive. Read the readme file which should be there for further infos.
CHANGELOG = 1.0.5: Onscreen controls, screenshots and splashscreen
CATEGORY = Games
ICON	= http://git.webos-internals.org/?p=games/duke3d.git;a=blob_plain;f=icon.png
LICENSE  = GNU License
SCREENSHOTS = [\
\"http://git.webos-internals.org/?p=games/duke3d.git;a=blob_plain;f=images/duke3d_title.png\",\
\"http://git.webos-internals.org/?p=games/duke3d.git;a=blob_plain;f=images/duke3d_menu.png\",\
\"http://git.webos-internals.org/?p=games/duke3d.git;a=blob_plain;f=images/duke3d_game1.png\",\
\"http://git.webos-internals.org/?p=games/duke3d.git;a=blob_plain;f=images/duke3d_game2.png\"\
 ]

SRC_GIT = git://git.webos-internals.org/games/duke3d.git

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
