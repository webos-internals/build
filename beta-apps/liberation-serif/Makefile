BASE     = liberation
NAME     = ${BASE}-serif
TITLE	 = Liberation Serif Fonts
APP_ID   = org.webosinternals.fonts.${NAME}
SRC_VER  = 1.07.0
VERSION  = ${SRC_VER}-2
BLDFLAGS = -p
TYPE	 = Font
CATEGORY = Serif
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
DESCRIPTION = The Liberation(tm) Fonts is a font family which aims at metric compatibility with Arial, Times New Roman, and Courier New.
ICON	 = http://www.webos-internals.org/images/d/d4/X-font-ttf.png

SRC_TGZ = https://fedorahosted.org/releases/l/i/${BASE}-fonts/${BASE}-fonts-ttf-${SRC_VER}.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all
	tar -C build -z -x -f $<
	mv build/${BASE}-fonts-ttf-${SRC_VER} build/src
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
