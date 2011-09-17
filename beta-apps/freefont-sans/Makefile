BASE     = freefont
NAME     = ${BASE}-sans
TITLE	 = GNU FreeFont Sans Fonts
APP_ID   = org.webosinternals.fonts.${NAME}
SRC_VER  = 20100919
VERSION  = ${SRC_VER}-2
BLDFLAGS = -p
TYPE	 = Font
CATEGORY = Sans
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
DESCRIPTION = The GNU FreeFont project aims to provide a useful set of free scalable (i.e., OpenType) fonts covering as much as possible of the ISO 10646/Unicode UCS (Universal Character Set).
ICON	 = http://www.webos-internals.org/images/d/d4/X-font-ttf.png

SRC_TGZ = ftp://ftp.gnu.org/pub/gnu/${BASE}/${BASE}-ttf-${SRC_VER}.tar.gz

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
	mv build/${BASE}-${SRC_VER} build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/*Sans*.ttf build/$*/usr/palm/applications/${APP_ID}/
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
