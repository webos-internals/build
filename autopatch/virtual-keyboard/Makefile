NAME = add-onscreen-keyboard
VERSIONS = 1.4.5-10
META_SUB_VERSION = 0
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
TITLE = Virtual Keyboard
CATEGORY = Mojo
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = <br>Double-tapping the gesture area (near the round silver button) will bring up the on-screen keyboard if you are in a text input field. Tap with two fingers separated or Double-tap quickly.  NOTE: The keyboard takes a couple of seconds to render, be patient.  In the Emulator, tap PageUp twice.  Double-tap to hide and double-tap to show. <br><br>\
	ADD-ONS: Install the KeyBoss and Uinput packages from Preware in order to enable hard key emulation (which will add autocorrect and browser backspace support for example).  NOTE: these packages are currently in alpha testing <br>
CHANGELOG = \
1.4.x-10: Fix Pixi landscape. <br>\
1.4.x-9: Tweak the preview key and key detection logic to make things smoother and more accurate. <br>\
1.4.x-7: Fix the re-render going from portrait->landscape->portrait. <br>\
1.4.x-6: Render only once per stage on first meta-double-tap, meta-double-tap to close. <br>\
				 Show an alert dialog if config file missing. <br>\
				 Add functionality to repeat key when held. <br>\
				 Add support for hard key emulation on special keys using KeyBoss service. <br>\
1.4.x-5: Fixed packaging so that it works again \
1.4.0-4 1.4.1-4 1.4.2-4 1.4.3-4 1.4.5-4: Split up theme and patch packages for quicker installation and easier updates for future changes. <br>\
1.4.0-1: Port to webOS 1.4.0 and fix undefined bug when tapping theme selector key. <br>\
1.3.5-4: Fixed bug causing undefined to be displayed in messaging app. <br>\
1.3.5-3: Fixed bug causing problems in memos app. <br>\
1.3.1-1: Ported to webos 1.3.1.  Had to remove AutoCorrect due to more strict file access via Mojo in 1.3.1. <br>\
1.2.1-4: Added AutoCorrect support <br>\
1.2.1-1: Expanded and optimized keyboard theming and user interface. Now using default theme made by un_designer.
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/b9/VirtualKeyboard_1.png\",\"http://www.webos-internals.org/images/b/bd/VirtualKeyboard_2.png\",\"http://www.webos-internals.org/images/3/34/VirtualKeyboard_3.png\",\"http://www.webos-internals.org/images/1/18/VirtualKeyboard_4.png\",\"http://www.webos-internals.org/images/1/10/VirtualKeyboard_5.png\",\"http://www.webos-internals.org/images/2/2a/VirtualKeyboard_6.png\"]
MAXWEBOSVERSION = 1.9.9

PATCH = add-onscreen-keyboard.patch

include ../common.mk

DEPENDS := $(DEPENDS), org.webosinternals.vkb-default-themes-config

ifeq ("${DUMMY_VERSION}", "")
SRC_GIT = git://github.com/webos-internals/virtual-keyboard.git

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mkdir -p build/src-${VERSION}
	tar -C build/src-${VERSION} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	sed -e 's|PATCH_NAME=|PATCH_NAME=$(shell basename ${PATCH})|' \
			-e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
			../postinst > build/all/CONTROL/postinst
	chmod ugo+x $@
endif

MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
