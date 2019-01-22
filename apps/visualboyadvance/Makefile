NAME     = visualboyadvance
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 1.3.4
HOMEPAGE = http://www.webos-internals.org/wiki/Application:VBA
MAINTAINER = dtzWill
TITLE   = VisualBoyAdvance
TYPE	= Application
DESCRIPTION = Port of the popular Game Boy, Game Boy Color, and Game Boy Advance emulator.<br>Official wiki <a href='http://www.webos-internals.org/wiki/Application:VBA'>here</a> (Please read it!).\
	<br><br>Please consider purchasing this app in the <a href='http://developer.palm.com/appredirect/?packageid=org.webosinternals.visualboyadvance.beta'>App Catalog</a>!\
	<br><br><b>Requires WebOS >= 1.4.5!</b><br>
CHANGELOG = \
<br><b>1.3.4</b><br>Webos 2.0 Support!<br>Confirm before reset<br>Misc memory fixes<br> \
<br><b>1.3.3</b><br>Center screen in skin virtual screen<br>Fix scaling code (broken GB in previous release!)<br>Added Sonic-NKTs transparent_small skin<br>Better handling of small amount of ROMs<br>Force correct orientation when skin is on<br>Fix performance regression introduced in previous release<br>Fix crash from Rom selector<br>Be sure to show user the highlighted ROM before loading it<br>\
<br><b>1.3.2</b><br>Transparent skin support, kinetic scrolling+scrollbar in rom selector, add reset and stretch options, set orientations correctly when in menus (for notifications), show user skin count.<br> \
<br><b>1.3.1</b><br>Added ability to preview skins in the skin menu (thanks for the suggestion oil)<br>Fix inability to launch help from no-roms screen (thanks 2ndflood)<br>Ensure autoframeskip is turned off when the user toggles it (thanks Brawler)<br>\
<br><b>1.3.0</b><br>Improved UI--New menu system including save states, settings, skins, and in-game help!<br>Turbo toggle<br>Autosave defaults to on<br>Support saving in Tactics Ogre (will not work if already started game)<br>Bug fix in rom selector<br>\
<br><b>1.2.4</b><br>Added two skins (Wiimote2 and cfbauer2!)<br>Fix loading of duplicate skins<br>Change default skin to have a/b buttons<br>Remove unused GBA debugger code<br>Small performance tweaks \
<br><br><b>1.2.1</b><br>Internal optimizations in rendering, faster on some games.<br>Portrait rom selector<br>Swipe to return to rom selector while playing<br>1.4.5 support!\
<br><br><b>1.1.2</b><br>Better d-pad behavior.<br>Notifications appear appropriately depending on orientation.<br>Better experience for new users--link to wiki is now clickable<br>Updated skins (thanks to everyone who contributed!)<br>Skins no longer appear in photos\
<br><br><b>1.1.1</b><br>Skin support! Thanks to VincentLaw, zsoc, crzisme, and nights0223 for their work!  See wiki for more info on creating your own/using community created ones<br>Support for turbo/capture bindings in custom controls<br><br><b>1.1.0</b><br>New ARM assembly implementation of emulated instructions. (small speed boost)<br>touchscreen controls! (thanks to VincentLaw and zsoc for their hard work on the graphics!)<br>new autosave feature (see wiki)<br>zip file support<br>options are now saved across sessions (orientation, mute, displaying emulation speed, etc)<br>rom selector strips file extensions, and cleans up rom names<br>rom selector hides hidden files\
<br><br><b>1.0.6</b><br>Fixed permissions issue causing custom config generation to crash\
<br><br><b>1.0.5</b><br>Fixed saving issues<br>Added ability to create custom keybindings (see wiki)<br>Removed annoying battery messages<br>Updated icon (thanks Spryal!)<br>Fixed name for hopefully better word-wrap in launcher\
<br><br><b>1.0.4</b><br>Remove dependence on upstart, should fix problem with VBA not launching.<br>backported sound fixes for (slight) speed, also added code to hopefully fix freezing  on pause<br>save/load state support<br>jump-to-letter functionality in rom selector for better management of large libraries<br>sort roms case insensitively\
<br><br><b>1.0.3</b><br>Added toggle for displaying emulation speed to help compatability report\
<br><br><b>1.0.2</b><br>Small metadata fix.\
<br><br><b>1.0.1</b><br>Small performance boost, public release!\
<br><br><b>1.0.0</b><br>Initial release.  Reimplemented rendering engine, rom selector.
CATEGORY = Games
ICON	= http://www.webos-internals.org/images/3/3c/Vba.png
LICENSE  = GPLv2
MINWEBOSVERSION = 1.4.5
DEVICECOMPATIBILITY = [\"Pre\", \"Pre2\"]
SCREENSHOTS = []

SRC_GIT = git://github.com/wosigh/visualboyadvance.git

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
	install -m 755 build/binaries/$*/vba build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
