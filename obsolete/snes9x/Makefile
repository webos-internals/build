NAME     = supernes
APP_ID   = org.webosinternals.${NAME}.preware
SIGNER   = org.webosinternals
VERSION  = 0.0.7
HOMEPAGE = http://www.webos-internals.org/wiki/Application:SuperNES
MAINTAINER = dtzWill
TITLE   = SuperNES
TYPE	= Application
DESCRIPTION = Port of the amazing Super Nintendo Entertainment System emulator 'Snes9x', as well as using pieces of DrNokSnes.<br>Official wiki <a href='http://www.webos-internals.org/wiki/Application:SuperNES'>here</a> (Please read it!).\
	<br><br><b>Requires WebOS >= 1.4.5!</b><br>
CHANGELOG = \
<b>0.0.7</b><br>Fix screen scaling issue in landscape.<br>Fix orientation issues (cardmode, notifications on wrong side).<br>Added reset button.<br>Added stretch (ignore aspect ratio) option.<br>Allow changing orientation with skin activated.<br>Added 'rpg2' skin. \
<br><br><b>0.0.6</b><br>Added skins (RPG, dpad, land_trans alternatives), thanks to Sonic-NKT and ncinerate!<br>Fixed color issues when display skins.<br>Removed 'default_snes' for now until its fixed. \
<br><br><b>0.0.5</b><br>Added jjcitron landscape skin. \
<br><br><b>0.0.4</b><br>(Transparent!) Skin support, misc bug fixes. \
<br><br><b>0.0.3</b><br>Fixed save states/menu issue (hopefully). \
<br><br><b>0.0.2</b><br>Renamed to 'SuperNES'. \
<br><br><b>0.0.1</b><br>First public release.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/8/83/Snes9x_small.png
LICENSE  = GPLv2, Snes9x License
MINWEBOSVERSION = 1.4.5
DEVICECOMPATIBILITY = [\"Pre\"]
SCREENSHOTS = []

SRC_GIT = git://github.com/webos-internals/snes9x.git

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
	cp -r build/src/pkg/pkg_base/* build/$*/usr/palm/applications/${APP_ID}/
	sed -i 's/@APPID@/${APP_ID}/' build/$*/usr/palm/applications/${APP_ID}/appinfo.json
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	install -m 755 build/binaries/$*/drnoksnes build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
