NAME     = dejavu
TITLE	 = DejaVu Fonts TTF
APP_ID   = org.webosinternals.fonts.${NAME}
VERSION  = 2.33
BLDFLAGS = -p
TYPE	 = Unknown
CATEGORY = Font
DESCRIPTION = The DejaVu fonts are a font family based on the Vera Fonts. Its purpose is to provide a wider range of characters while maintaining the original look and feel through the process of collaborative development.
ICON	 = http://www.webos-internals.org/images/d/d4/X-font-ttf.png

SRC_BZ2 = http://downloads.sourceforge.net/project/${NAME}/${NAME}/${VERSION}/${NAME}-fonts-ttf-${VERSION}.tar.bz2

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
	mv build/${NAME}-fonts-ttf-${VERSION} build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/ttf/* build/$*/usr/palm/applications/${APP_ID}/
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
