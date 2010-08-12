NAME     = visualboyadvance
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.2.0
HOMEPAGE = http://www.webos-internals.org/wiki/Application:VBA
MAINTAINER = dtzWill
TITLE   = VisualBoyAdvance
TYPE	= Application
DESCRIPTION = Port of the popular Game Boy, Game Boy Color, and Game Boy Advance emulator.<br>Official wiki <a href="http://www.webos-internals.org/wiki/Application:VBA">here</a> (Please read it!).<br>If you like this game, please consider donating: <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_donations&amp;business=3S7ULCYRCDWS8&amp;lc=US&amp;item_name=Will%20Dietz&amp;item_number=palm%20pre&amp;currency_code=USD&amp;bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted" target="_blank"><img src="https://www.paypal.com/en_US/i/btn/btn_donate_SM.gif" alt="" border="0"></a>.  All donations go back into development.<br>NOTE! This app requires WebOS 1.4.5!
CHANGELOG = 1.2.0<br>Internal optimizations in rendering, faster on some games.<br>Portrait rom selector<br>Swipe to return to rom selector while playing<br>1.4.5 support!<br><br>1.1.2<br>Better d-pad behavior.<br>Notifications appear appropriately depending on orientation.<br>Better experience for new users--link to wiki is now clickable<br>Updated skins (thanks to everyone who contributed!)<br>Skins no longer appear in photos<br>1.1.1<br>Skin support! Thanks to VincentLaw, zsoc, crzisme, and nights0223 for their work!  See wiki for more info on creating your own/using community created ones<br><br>Support for turbo/capture bindings in custom controls<br>1.1.0<br>New ARM assembly implementation of emulated instructions. (small speed boost)<br>touchscreen controls! (thanks to VincentLaw and zsoc for their hard work on the graphics!)<br>new autosave feature (see wiki)<br>zip file support<br>options are now saved across sessions (orientation, mute, displaying emulation speed, etc)<br>rom selector strips file extensions, and cleans up rom names<br>rom selector hides hidden files<br>1.0.6 Fixed permissions issue causing custom config generation to crash<br>1.0.5 Fixed saving issues<br>Added ability to create custom keybindings (see wiki)<br>Removed annoying battery messages<br>Updated icon (thanks Spryal!)<br>Fixed name for hopefully better word-wrap in launcher<br>1.0.4 Remove dependence on upstart, should fix problem with VBA not launching.<br>backported sound fixes for (slight) speed, also added code to hopefully fix freezing  on pause<br>save/load state support<br>jump-to-letter functionality in rom selector for better management of large libraries<br>sort roms case insensitively<br>1.0.3 Added toggle for displaying emulation speed to help compatability reports<br>1.0.2 Small metadata fix. <br>1.0.1 Small performance boost, public release!<br>1.0.0 Initial release.  Reimplemented rendering engine, rom selector.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/3/3c/Vba.png
LICENSE  = GPLv2
SCREENSHOTS = []

SRC_GIT = git://git.webos-internals.org/games/visualboyadvance.git

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
	rm -rf build/$* -rf
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	install -m 755 build/binaries/$*/vba build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
