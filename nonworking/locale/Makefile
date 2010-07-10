NAME    = locale
TITLE	= gettext locale support
APP_ID	= org.webosinternals.${NAME}
VERSION	= 5
CATEGORY = Infrastructure
TYPE	= Utility
MAINTAINER = hape, noradtux
DESCRIPTION = Provides data files to enable localization in programs unsing the native localization methods like Navit.
CHANGELOG = 1.0.0: Initial release, providing ${LOCALES}
SRC = ../../toolchain/cs07q3armel/build/arm-2007q3/arm-none-linux-gnueabi/libc/usr/lib/locale
LOCALES = cs_CZ de_DE en_CA en_GB en_US es_MX es_US fr_CA fr_FR he_IL zh_CN \
	  cs_CZ.utf8 de_DE.utf8 en_CA.utf8 en_GB.utf8 en_US.utf8 es_MX.utf8 \
	  es_US.utf8 fr_CA.utf8 fr_FR.utf8 he_IL.utf8 zh_CN.utf8

D = build/$*/usr/palm/applications/${APP_ID}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir build
	touch $@

.PHONY: build
build: build/.built-${VERSION}
build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p ${D}
	tar -C ${SRC} -c $(foreach locale, ${LOCALES}, $(locale) ) | gzip --best > ${D}/locales.tar.gz
	touch $@

clobber::
	rm -rf build
