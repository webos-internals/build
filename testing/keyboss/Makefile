NAME        = keyboss
TITLE       = KeyBoss
APP_ID      = org.webosinternals.${NAME}
SIGNER      = org.webosinternals
BLDFLAGS    = -p
VERSION     = 0.2.0
TYPE        = Application
CATEGORY    = System Utilities
DEVICECOMPATIBILITY = [\"Pre\"]
HOMEPAGE    = 
ICON        = 
DESCRIPTION = Become the BOSS of your keyboard. This App/Service combo is intended to give the user as much control as possible over the functionality of the hard keyboard.  It also provides ability to emulate keyboard events, for use by projects like the Virtual Keyboard. Curently the application allows you to change the repeat rate and enable KeyCaps like functionality.  <br>NOTE: The KeyCaps functionality (and keyboard emulation) requires the userspace input module package.  Please install the userspace input module package found in Preware as well.
CHANGELOG   = \
0.2.0: Re-design for functionality.  Change to concept of trigger/action lists.  Smoothed out key handling code for better integration with webOS/hidd. <br>\
0.1.3: Fix double for func logic. <br>\
0.1.2: Fix bug causing things like wallpaper to reset after reboot. <br>\
0.1.1: Fix sym key bug. <br>\
0.1.0: Inception
SCREENSHOTS = 
LICENSE     = GPL v2 Open Source
MAINTAINER  = Eric J Gaudet <emoney_33@yahoo.com>

SRC_GIT     = git://git.webos-internals.org/applications/keyboss.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
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

