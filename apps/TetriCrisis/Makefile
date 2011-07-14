NAME     = tetricrisis
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
VERSION  = 5.9-1
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:TetriCrisis
MAINTAINER = Ryan Hope
TITLE   = TetriCrisis
TYPE	= Application
DESCRIPTION = THE Open-Source Cross-Platform Tetris(R) Video Game!<br><br>	\
	      Controls:<br>							\
	      Q - left<br>							\
	      W - up<br>							\
	      E - right<br>							\
	      S - down<br>							\
	      O - rotate counter-clockwise<br>					\
	      P - rotate clockwise						\

CATEGORY = Games
ICON	= http://www.webos-internals.org/images/7/75/Icon_Tetris.png
LICENSE  = GPL

SRC_GIT = git://git.webos-internals.org/games/TetriCrisis.git

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
	install -m 755 build/binaries/$*/tetricrisis build/$*/usr/palm/applications/${APP_ID}/bin/
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
