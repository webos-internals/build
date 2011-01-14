NAME        = keyboss
TITLE       = KeyBoss
APP_ID      = org.webosinternals.${NAME}
SIGNER      = org.webosinternals
BLDFLAGS    = -p
VERSION     = 0.3.1
TYPE        = Application
CATEGORY    = System Utilities
HOMEPAGE    = http://www.webos-internals.org/wiki/KeyBoss
ICON        = http://www.webos-internals.org/images/6/61/Icon_WebOSInternals_KeyBoss.png
DESCRIPTION = Become the BOSS of your keyboard. This App/Service combo is intended to give the user as much control as possible over the functionality of the hard keyboard.  It also provides ability to emulate keyboard events, for use by projects like the Virtual Keyboard. Curently the application allows you to change the repeat rate, enable/disable the fat finger filter and enable KeyCaps like functionality.<br><br>\
Start typing anywhere for preview header to show, tap the header to hide. <br>
CHANGELOG   = \
0.3.1: Fixed postinst/prerm to install udev script. <br>\
0.3.0: Added Pixi support. <br>\
       Fixed sticky settings getting mixed up. <br>\
0.2.9: Added Fat Finger Filter control. <br>\
       Added persistent settings. <br>\
			 Added ability to reset to defaults. <br>\
			 Added code to disable after unclean shutdown. <br>\
0.2.6: Fixed removal of tap action. <br>\
0.2.5: Added preview header for testing settings. <br>\
       Changed logic to not cycle when only 1 action active. <br>\
			 Fixed tap action bug that missed keys in universal search. <br>\
			 Added start/changelog scene. <br>\
0.2.4: Added enable/disable toggle. <br>\
0.2.3: Minor fixes and performance stability. <br>\
0.2.2: Made upstart script start after uinput upstart script. <br>\
0.2.1: Fixed minor bug in tap timeout causing erratic behaviour with tap actions. <br>\
0.2.0: Re-designed for functionality.  Change to concept of trigger/action lists.  Smoothed out key handling code for better integration with webOS/hidd. <br>\
0.1.3: Fixed double for func logic. <br>\
0.1.2: Fixed bug causing things like wallpaper to reset after reboot. <br>\
0.1.1: Fixed sym key bug. <br>\
0.1.0: Inception
SCREENSHOTS = 
LICENSE     = GPL v2 Open Source
MAINTAINER  = Eric Gaudet <emoney_33@yahoo.com>

SRC_GIT     = git://git.webos-internals.org/applications/keyboss.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc CFLAGS=${CFLAGS_$*} \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
	install -m 755 build/src/src/restart_hidd build/$*/usr/palm/applications/${APP_ID}/bin/restart_hidd
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

clobber::
	rm -rf build

