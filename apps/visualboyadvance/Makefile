NAME     = visualboyadvance
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.0.6
HOMEPAGE = http://www.webos-internals.org/wiki/Application:VBA
MAINTAINER = dtzWill
TITLE   = VisualBoyAdvance
TYPE	= Application
DESCRIPTION = Port of the popular Game Boy, Game Boy Color, and Game Boy Advance emulator.<br>Official wiki <a href="http://www.webos-internals.org/wiki/Application:VBA">here</a> (Please read it!).<br>If you like this game, please consider <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=3S7ULCYRCDWS8&lc=US&item_name=Will%20Dietz&item_number=palm%20pre&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted">donating</a>.  All donations go back into development.
CHANGELOG = 1.0.6 Fixed permissions issue causing custom config generation to crash<br>1.0.5 Fixed saving issues<br>Added ability to create custom keybindings (see wiki)<br>Removed annoying battery messages<br>Updated icon (thanks Spryal!)<br>Fixed name for hopefully better word-wrap in launcher<br>1.0.4 Remove dependence on upstart, should fix problem with VBA not launching.<br>backported sound fixes for (slight) speed, also added code to hopefully fix freezing  on pause<br>save/load state support<br>jump-to-letter functionality in rom selector for better management of large libraries<br>sort roms case insensitively<br>1.0.3 Added toggle for displaying emulation speed to help compatability reports<br>1.0.2 Small metadata fix. <br>1.0.1 Small performance boost, public release!<br>1.0.0 Initial release.  Reimplemented rendering engine, rom selector.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/3/3c/Vba.png
LICENSE  = GPLv2
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/games/visualboyadvance.git

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
	install -m 755 build/binaries/$*/vba build/$*/usr/palm/applications/${APP_ID}/bin/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
