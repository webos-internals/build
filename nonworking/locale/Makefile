NAME    = locale
TITLE	= gettext locale support
APP_ID	= org.webosinternals.${NAME}
VERSION	= 1
CATEGORY = Infrastructure
TYPE	= Miscellaneous
MAINTAINER = hape, noradtux
DESCRIPTION = Provides data files to enable localization in programs unsing \
	      the native localization methods like Navit.
CHANGELOG = 1: Initial release, providing ${LOCALES}
LOCALES = cs_CZ.utf8 de_DE.utf8 en_CA.utf8 en_GB.utf8 en_US.utf8 es_MX.utf8 \
	  es_US.utf8 fr_CA.utf8 fr_FR.utf8 he_IL.utf8 zh_CN.utf8

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/miscellaneous/locale.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}
build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p ${D}
	#tar -C ${SRC} -c $(foreach locale, ${LOCALES}, $(locale) ) | gzip --best > ${D}/locales.tar.gz
	tar --exclude=".git*" -C build/src -c . | gzip --best > ${D}/locales.tar.gz
	touch $@

clobber::
	rm -rf build
