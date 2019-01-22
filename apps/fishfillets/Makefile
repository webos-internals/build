NAME     = fishfillets
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
VERSION  = 0.9.2-2
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Fishfillets
MAINTAINER = debilater
TITLE   = Fish Fillets NG
TYPE	= Application
DESCRIPTION = Fish Fillets NG is strictly a puzzle game. The goal in every of the seventy levels is always the same: find a safe way out. The fish utter witty remarks about their surroundings, the various inhabitants of their underwater realm quarrel among themselves or comment on the efforts of your fish. The whole game is accompanied by quiet, comforting music.
CHANGELOG = 0.9.2: initial public test release
CATEGORY = Games
ICON	= http://i.imgur.com/Tj4Oe.png
LICENSE  = GPL
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/6/6b/Fishfillets-level.png\",\
\"http://www.webos-internals.org/images/4/44/Fishfillets-map.png\",\
\"http://www.webos-internals.org/images/2/2d/Fishfillets-options.png\",\
\"http://www.webos-internals.org/images/c/c9/Fishfillets-credits.png\",\
\"http://www.webos-internals.org/images/8/86/Fishfillets-Keyboard-320.png\" ]

SRC_GIT = git://github.com/wosigh/fishfillets.git


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
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/
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
