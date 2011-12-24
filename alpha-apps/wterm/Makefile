NAME     = wterm
TITLE    = wTerm
APP_ID   = us.ryanhope.${NAME}
SRC_VER  = 0.1.5
VERSION  = ${SRC_VER}-2
TYPE     = Application
BLDFLAGS = -p
CATEGORY = System Utilities
MAINTAINER = PuffTheMagic
HOMEPAGE = https://github.com/PuffTheMagic/wTerm
ICON     = https://github.com/PuffTheMagic/wTerm/raw/master/images/icon-64.png
DESCRIPTION = wTerm is a Enyo PDK/Hybrid Terminal Emulator for the webOS platform.<br><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VU4L7VTGSR5C2"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif"/></a>
CHANGELOG = \
0.1.5: Do better on basic vttest's<br> \
0.1.4: Handle some uncaught CSIs<br> \
0.1.3: First decent alpha version to play with.

SCREENSHOTS = [\
\"http://ompldr.org/vYnV4MQ/wterm_2011-21-12_205004.png\",\
]
LICENSE  = GPL v2 Open Source
MINWEBOSVERSION = 3.0.0

GIT_TAG = v${SRC_VER}
SRC_GIT = git://github.com/${MAINTAINER}/${TITLE}.git

D = build/$*/usr/palm/applications/${APP_ID}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk

include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

.PHONY: post-unpack
post-unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	echo "CXX=${CROSS_COMPILE_$*}g++" > build/src/Makefile.inc
	echo "MARCH_TUNE=-O2 -march=armv7-a -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp" >> build/src/Makefile.inc
	echo "ROOT=${STAGING_DIR_$*}/usr" >> build/src/Makefile.inc
	cd build/src; ${MAKE} clean wterm DEVICE=1
	mkdir -p ${D}
	${CROSS_COMPILE_$*}strip build/src/${NAME}
	install -m 755 build/src/${NAME} ${D}
	rm -rf build/src/src/plugin
	cp -r build/src/* ${D}
	touch $@
	
build/%/CONTROL/prerm:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/pmPreRemove.script $@
	chmod ugo+x $@

build/%/CONTROL/postinst:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/pmPostInstall.script $@
	chmod ugo+x $@

clobber::
	rm -rf build
