BASE     = bitstream-vera
NAME     = ${BASE}-sans
TITLE	 = Bitstream Vera Sans Fonts
APP_ID   = org.webosinternals.fonts.${NAME}
SRC_VER  = 1.10
VERSION  = ${SRC_VER}-2
BLDFLAGS = -p
TYPE	 = Font
CATEGORY = Sans
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
DESCRIPTION = Bitstream Vera Fonts
ICON	 = http://www.webos-internals.org/images/d/d4/X-font-ttf.png

SRC_BZ2 = http://ftp.gnome.org/pub/GNOME/sources/ttf-${BASE}/${SRC_VER}/ttf-${BASE}-${SRC_VER}.tar.bz2

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.bz2
	rm -rf build
	mkdir -p build/all
	tar -C build -j -x -f $<
	mv build/ttf-${BASE}-${SRC_VER} build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	rm -f build/src/VeraSe*.ttf; rm -f build/src/VeraMo*.ttf
	cp -r build/src/Vera*.ttf build/$*/usr/palm/applications/${APP_ID}/
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
