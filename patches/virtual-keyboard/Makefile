NAME     = virtual-keyboard
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.0.1
HOMEPAGE = http://www.preware.org/wiki/On_Screen_Keyboard
MAINTAINER = WebOS Internals <support@webos-internal.org>
DESCRIPTION = Virtual Keyboard
SECTION = WebOS Patches
DEPENDS = org.webosinternal.patch

PATCHES = add-onscreen-keyboard.patch
FILES = /usr/palm/frameworks/mojo/builtins/palmInitFramework191_15.js \
	/usr/palm/frameworks/mojo/submissions/191.15/stylesheets/global.css

SRC_GIT = git://git.webos-internals.org/webos/modifications.git
include ../../support/download.mk

include ../../support/patch-md5sums.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build build.tmp
	mkdir -p build.tmp
	tar -C build.tmp -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mkdir -p build
	cp -r build.tmp/frameworks build/src
	rm -rf build.tmp
	touch $@

.PHONY: build
build: build/.built

build/.built: build/.unpacked build/md5sums
	rm -rf build/${NAME}
	rm -rf build.tmp
	mkdir -p build.tmp
	tar -C build.tmp -xvf build/src/virtual-keyboard-themes.tar.gz
	mkdir -p build/${NAME}/usr/palm/applications/${APP_ID}
	mv build.tmp/media/internal/virtual-keyboard
	   build/${NAME}/usr/palm/applications/${APP_ID}/
	rm -rf build.tmp
	mkdir -p build/${NAME}/usr/palm/applications/${APP_ID}/patches
	install -m 644 build/src/${PATCHES} build/${NAME}/usr/palm/applications/${APP_ID}/patches/
	for f in ${FILES} ; do \
	  grep $$f build/md5sums >> build/${NAME}/usr/palm/applications/${APP_ID}/md5sums ; \
	done
	touch $@

build/${NAME}/CONTROL/%: files/%
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	install files/$* build/${NAME}/CONTROL
	chmod ugo+x $@

include ../../support/service-package.mk

clobber::
	rm -rf build
