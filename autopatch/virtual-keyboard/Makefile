NAME     = add-onscreen-keyboard
WEBOS_VERSION = 1.2.1
IPKG_VERSION = 1
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
TITLE = Virtual Keyboard
CATEGORY = Mojo
ICON	= http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = Double-tapping the gesture area (near the round silver button) will bring up the on-screen keyboard if you are in a text input field. Tap with two fingers separated or Double-tap quickly.  NOTE: The keyboard takes a couple of seconds to render, be patient.  In the Emulator, tap PageUp twice.
CHANGELOG = ${VERSION}: Expanded and optimized keyboard theming and user interface. Now using default theme made by un_designer.
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/b9/VirtualKeyboard_1.png\",\"http://www.webos-internals.org/images/b/bd/VirtualKeyboard_2.png\",\"http://www.webos-internals.org/images/3/34/VirtualKeyboard_3.png\",\"http://www.webos-internals.org/images/1/18/VirtualKeyboard_4.png\",\"http://www.webos-internals.org/images/1/10/VirtualKeyboard_5.png\",\"http://www.webos-internals.org/images/2/2a/VirtualKeyboard_6.png\"]
POSTINSTALLFLAGS = RestartLuna
POSTREMOVEFLAGS  = RestartLuna

PATCH = add-onscreen-keyboard.patch
FILES = /usr/palm/frameworks/mojo/builtins/palmInitFramework191_15.js \
	/usr/palm/frameworks/mojo/submissions/191.15/stylesheets/global.css

SRC_GIT = git://git.webos-internals.org/patches/virtual-keyboard.git

include ../common.mk

include ../../support/download.mk

#include ../../support/patch-md5sums.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src-${VERSION}
	tar -C build/src-${VERSION} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	rm -rf build.tmp
	mkdir -p build.tmp
	tar -C build.tmp -xvf build/src-${VERSION}/virtual-keyboard-themes.tar.gz
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	mv build.tmp/media/internal/virtual-keyboard \
	   build/all/usr/palm/applications/${APP_ID}/
	rm -rf build.tmp
	install -m 644 build/src-${VERSION}/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	install -m 644 build/src-${VERSION}/postinst_extra build/all/usr/palm/applications/${APP_ID}/
	install -m 644 build/src-${VERSION}/prerm_extra build/all/usr/palm/applications/${APP_ID}/
	#for f in ${FILES} ; do \
	  #grep $$f build/md5sums >> build/all/usr/palm/applications/${APP_ID}/md5sums ; \
	#done
	touch $@

MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
