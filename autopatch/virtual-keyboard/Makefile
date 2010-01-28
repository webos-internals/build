NAME = add-onscreen-keyboard
VERSIONS = 1.2.1-5 1.3.1-2 1.3.5-3
META_SUB_VERSION = 1
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
TITLE = Virtual Keyboard
CATEGORY = Mojo
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = Double-tapping the gesture area (near the round silver button) will bring up the on-screen keyboard if you are in a text input field. Tap with two fingers separated or Double-tap quickly.  NOTE: The keyboard takes a couple of seconds to render, be patient.  In the Emulator, tap PageUp twice.
CHANGELOG = 1.3.5-3: Fixed bug causing problems in memos app. <br>1.3.1-1: Ported to webos 1.3.1.  Had to remove AutoCorrect due to more strict file access via Mojo in 1.3.1. <br>1.2.1-4: Added AutoCorrect support <br>1.2.1-1: Expanded and optimized keyboard theming and user interface. Now using default theme made by un_designer.
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/b9/VirtualKeyboard_1.png\",\"http://www.webos-internals.org/images/b/bd/VirtualKeyboard_2.png\",\"http://www.webos-internals.org/images/3/34/VirtualKeyboard_3.png\",\"http://www.webos-internals.org/images/1/18/VirtualKeyboard_4.png\",\"http://www.webos-internals.org/images/1/10/VirtualKeyboard_5.png\",\"http://www.webos-internals.org/images/2/2a/VirtualKeyboard_6.png\"]

PATCH = add-onscreen-keyboard.patch
FILES = /usr/palm/frameworks/mojo/builtins/palmInitFramework191_15.js \
	/usr/palm/frameworks/mojo/submissions/191.15/stylesheets/global.css

SRC_GIT = git://git.webos-internals.org/patches/virtual-keyboard.git

include ../common.mk
include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mkdir -p build/src-${VERSION}
	tar -C build/src-${VERSION} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
