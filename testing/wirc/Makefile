NAME     = wirc
TITLE    = wIRC
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.2.3
TYPE     = Application
CATEGORY = System Utilities
MAINTAINER = oil, PuffTheMagic, zsoc, egaudet, rwhitby
HOMEPAGE = http://www.webos-internals.org/wiki/Application:WIRC
ICON     = http://www.webos-internals.org/images/1/10/Icon_WebOSInternals_wIRC.png
DESCRIPTION = A native webOS IRC client.
CHANGELOG = 0.2.3: Renamed appid and removes separate wircd service on install.<br>0.2.0: Service and Application combined for easier and safer install and removal.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5a/Wirc.png\",\
\"http://www.webos-internals.org/images/d/d2/Wirc_2.png\",\
\"http://www.webos-internals.org/images/b/b6/Wirc_3.png\",\
\"http://www.webos-internals.org/images/7/7c/Wirc_4.png\",\
\"http://www.webos-internals.org/images/9/9d/Wirc_5.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/wIRC.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built build/i686.built
	touch $@

include ../../support/cross-compile.mk

build/%.built: build/.unpacked
	rm -rf build/$*
	( cd build/src/src/libircclient ; \
	  CC=${CROSS_COMPILE_$*}gcc ./configure && \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
		SUBDIRS=src clean all )
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
		clobber ${APP_ID} )
	mkdir -p build/src/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	rm -rf build/$*/usr/palm/applications/${APP_ID}/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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
