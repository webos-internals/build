NAME     = stella
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 3.0.0
STELLAVERSION = 3.0
DEPENDS  = org.webosinternals.upstartmgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Stella
MAINTAINER = debilater
TITLE   = Stella Atari 2600 VCS Emulator 3.0
TYPE	= Application
DESCRIPTION = Stella is a multi-platform Atari 2600 VCS emulator ported to webOS.<br>Official wiki <a href="http://www.webos-internals.org/wiki/Application:Stella">here</a> (Please read it!).<br>If you like this game, please consider <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=10505897">donating</a>.  All donations go back into development.
CHANGELOG = 3.0.0: initial public test release
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/0/0e/Stella_icon.png
LICENSE  = GPL
SCREENSHOTS = [\"http://www.webos-internals.org/images/0/0e/Stella_icon.png\", \"http://www.webos-internals.org/images/0/0e/Stella_icon.png\"]

SRC_GIT = git://git.webos-internals.org/games/stella.git

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
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	install -m 755 build/binaries/$*/stella build/$*/usr/palm/applications/${APP_ID}/bin/
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
