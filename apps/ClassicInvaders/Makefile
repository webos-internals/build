NAME     = cinvaders
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
VERSION  = 1.0.0-1
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:ClassicInvaders
MAINTAINER = Ryan Hope
TITLE   = Classic Invaders
TYPE	= Application
DESCRIPTION = Classic Space Invaders!<br><br>									\
	      <b>NOTE: Game takes a few seconds to load. While loading a black screen is normal!</b><br><br>	\
	      Controls:<br>											\
	      Tilt Left - left<br>										\
	      Tilt Up - up<br>											\
	      Tilt Right - right<br>										\
	      Tilt Down - down<br>										\
	      Tap Screen - select<br>										\
	      Tap Gesture - Shoot <br>										\

CATEGORY = Games
ICON	= http://www.webos-internals.org/images/6/6e/Icon_SpaceInvaders.png
LICENSE  = GPL

SRC_GIT = git://github.com/webos-internals/Classic_Invaders.git

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
	install -m 755 build/binaries/$*/cinvaders build/$*/usr/palm/applications/${APP_ID}/bin/
	cp -r build/src/src/data build/$*/usr/palm/applications/${APP_ID}/bin/
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
