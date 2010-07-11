NAME    = locale
TITLE	= Locale Support Infrastructure
APP_ID	= org.webosinternals.${NAME}
VERSION	= 0.1.0
CATEGORY = Infrastructure
TYPE	= Linux Application
MAINTAINER = hape, noradtux
DESCRIPTION = Provides data files to enable localization in programs using the native localization methods like Navit.
CHANGELOG = 0.1.0: Initial release, providing ${LOCALES}
LOCALES = cs_CZ.utf8 de_DE.utf8 en_CA.utf8 en_GB.utf8 en_US.utf8 es_MX.utf8 \
	  es_US.utf8 fr_CA.utf8 fr_FR.utf8 he_IL.utf8 zh_CN.utf8

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/libraries/locale.git

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
	tar -C build/src/ -c ${LOCALES} | gzip --best > ${D}/locales.tar.gz
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
