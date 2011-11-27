BASE     = droid
NAME     = ${BASE}-serif
TITLE	 = Droid Serif Fonts
APP_ID   = org.webosinternals.fonts.${NAME}
SRC_VER  = 1.0
VERSION  = ${SRC_VER}-2
BLDFLAGS = -p
TYPE	 = Font
CATEGORY = Serif
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
DESCRIPTION = Droid font family courtesy of Google & Ascender.
ICON	 = http://www.webos-internals.org/images/d/d4/X-font-ttf.png

SRC_ZIP = http://download.damieng.com/fonts/redistributed/DroidFamily.zip

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.zip
	rm -rf build
	mkdir -p build/all
	unzip -d build $<
	mv build/DroidFonts build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/*Serif*.ttf build/$*/usr/palm/applications/${APP_ID}/
	touch $@

clobber::
	rm -rf build

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 control/prerm build/$*/CONTROL
	chmod ugo+x $@
