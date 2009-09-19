NAME     = virtual-keyboard
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.2.2
HOMEPAGE = http://www.webos-internals.org/wiki/On_Screen_Keyboard
MAINTAINER = WebOS Internals <support@webos-internal.org>
TITLE = Virtual Keyboard
TYPE = Patch
CATEGORY = WebOS Patches
DEPENDS = org.webosinternals.patch
ICON	= http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = Double-tapping the gesture area (near the round silver button) will bring up the on-screen keyboard if you are in a text input field. Tap with two fingers separated or Double-tap quickly.  In the Emulator, tap PageUp twice.
SCREENSHOTS = [\"http://www.webos-internals.org/images/e/ed/Messaging_2009-22-08_000708.png\"]
POSTINSTALLFLAGS = RestartLuna
POSTREMOVEFLAGS  = RestartLuna

PATCHES = add-onscreen-keyboard.patch
FILES = /usr/palm/frameworks/mojo/builtins/palmInitFramework191_15.js \
	/usr/palm/frameworks/mojo/submissions/191.15/stylesheets/global.css

SRC_GIT = git://git.webos-internals.org/patches/virtual-keyboard.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/patch-md5sums.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built

build/.built: build/.unpacked build/md5sums
	rm -rf build/all
	rm -rf build.tmp
	mkdir -p build.tmp
	tar -C build.tmp -xvf build/src/virtual-keyboard-themes.tar.gz
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	mv build.tmp/media/internal/virtual-keyboard \
	   build/all/usr/palm/applications/${APP_ID}/
	rm -rf build.tmp
	mkdir -p build/all/usr/palm/applications/${APP_ID}/patches
	install -m 644 build/src/${PATCHES} build/all/usr/palm/applications/${APP_ID}/patches/
	for f in ${FILES} ; do \
	  grep $$f build/md5sums >> build/all/usr/palm/applications/${APP_ID}/md5sums ; \
	done
	touch $@

build/all/CONTROL/prerm: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/prerm build/all/CONTROL
	chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked
	rm -f $@
	mkdir -p build/all/CONTROL
	install -m 0775 build/src/postinst build/all/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build
