FONTPKG  = base
NAME     = xfonts-${FONTPKG}
TITLE    = Standard fonts for X
APP_ID   = org.webosinternals.fonts.${NAME}
VERSION  = 1.0.0
BLDFLAGS = -p
TYPE     = Font
CATEGORY = xfonts
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
DESCRIPTION = Standard set of low-resolution bitmapped fonts
ICON        = http://www.webos-internals.org/images/d/d4/X-font-ttf.png

BASE_FONT_URL = http://xorg.freedesktop.org/releases/individual/font/
FONTS= \
	font-arabic-misc-1.0.3 \
	font-cursor-misc-1.0.3 \
	font-daewoo-misc-1.0.3 \
	font-dec-misc-1.0.3    \
	font-isas-misc-1.0.3   \
	font-jis-misc-1.0.3 \
	font-micro-misc-1.0.3 \
	font-misc-misc-1.1.2 \
	font-mutt-misc-1.0.3 \
	font-schumacher-misc-1.1.2 \
	font-sony-misc-1.0.3 \
	font-sun-misc-1.0.3

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

FONT_TARGETS = $(addprefix build/.built-,${FONTS})
FONT_DOWNLOADS := $(addsuffix -${VERSION}.tar.bz2,$(addprefix ${DL_DIR}/,${FONTS}))

# Download rule
.PRECIOUS: ${FONT_DOWNLOADS}
${DL_DIR}/%-${VERSION}.tar.bz2:
	rm -f $@ $@.tmp
	mkdir -p ${DL_DIR}
	curl -f -R -L -o $@.tmp ${BASE_FONT_URL}/$*.tar.bz2
	mv $@.tmp $@

# Unpack each font
build/.unpacked-%-${VERSION}: ${DL_DIR}/%-${VERSION}.tar.bz2
	-rm build/$* build/tmp-$* -rf
	mkdir -p build/tmp-$*
	tar -C build/tmp-$* -j -x -f $<
	mv build/tmp-$*/$* build/$*
	rm -rf build/tmp-$*
	touch $@

.PHONY: build
build: build/all.built-${VERSION}

${FONT_TARGETS}:
build/.built-%: build/.unpacked-%-${VERSION}
	cd build/$* && ./configure
	cd build/$* && $(MAKE)
	touch $@

define newline


endef
INSTALL_PREFIX=$(PWD)/build/install
build/.built-${VERSION}: ${FONT_TARGETS}
	-rm -rf $(INSTALL_PREFIX)
	-rm -rf build/all
	mkdir -p build/install
	$(foreach font,$(FONTS), \
		cd build/$(font) && make install DESTDIR=$(INSTALL_PREFIX)$(newline))
	mkdir -p build/all/usr/palm/applications/${APP_ID}/
	cp -r ${INSTALL_PREFIX}/usr/share/fonts/* build/all/usr/palm/applications/${APP_ID}/
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
