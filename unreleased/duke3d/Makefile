NAME     = duke3d
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.0.3
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Duke3D
MAINTAINER = Henk Jonas
TITLE   = Duke3D
TYPE	= Application
DESCRIPTION = Port of the popular Duke Nukem 3D shooter game written by Real Software.<br>It requires webOS 1.3.5 or later.
CHANGELOG = 1.0.0: Control overlay. Initial release.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/3/3a/Quake-icon3-resized.png
LICENSE  = GNU License
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/2/26/Quake_Menu.png\",\
\"http://www.webos-internals.org/images/4/4b/Quake_Lava.png\",\
\"http://www.webos-internals.org/images/6/66/Quake_Ogre.png\"\
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
