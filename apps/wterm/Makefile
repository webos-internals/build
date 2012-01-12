NAME     = wterm
TITLE    = wTerm
APP_ID   = us.ryanhope.${NAME}
SRC_VER  = 0.3.0
VERSION  = ${SRC_VER}-1
TYPE     = Application
BLDFLAGS = -p
CATEGORY = System Utilities
MAINTAINER = PuffTheMagic
HOMEPAGE = https://github.com/PuffTheMagic/wTerm
ICON     = https://github.com/PuffTheMagic/wTerm/raw/master/images/icon-64.png
DESCRIPTION = wTerm is a Enyo PDK/Hybrid Terminal Emulator for the webOS platform.<br><br><a href='https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VU4L7VTGSR5C2'><img src='http://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif'/></a><br>
CHANGELOG = \
0.3.0: Lots of font improvements, lots of new escape codes processed, lots of fixes to broken escape code processing, fix cursor bugs, obey rotation lock, remove debug output for releases<br> \
0.2.6: HUGE performance increase<br> \
0.2.5: Fixes idle CPU usage, some rendering optimizations, no more bright backgrounds for bold foreground<br> \
0.2.4: Portrait mode keyboard and orientation change support, few small bug fixes<br> \
0.2.3: Use SDL_Wait instead of SDL_Poll, update term rows/cols when font size changes<br> \
0.2.2: Predefined color schemes, font size and colors change on the fly, term size changes properly when vkb is toggled<br> \
0.2.1: Customizable colors, new prefs popup, implement DECREQTPARM<br> \
0.2.0: Toggle VKB visibility, support box drawing charset (for mc)<br> \
0.1.9: Customizable font size, show/hide cursor support, set/clear tab stops<br> \
0.1.8: Function keys now work, implement support for insert/delete line, delete characters<br> \
0.1.7: Fix the pipe and plus keys<br> \
0.1.6: Tinkering<br> \
0.1.5: Do better on basic vttest's<br> \
0.1.4: Handle some uncaught CSIs<br> \
0.1.3: First decent alpha version to play with.

SCREENSHOTS = [\
\"http://ompldr.org/vYzIzNw/wterm_2012-04-01_151716.png\",\
\"http://ompldr.org/vYnl6Mw/wterm_2011-29-12_152014.png\",\
\"http://ompldr.org/vYnV4MQ/wterm_2011-21-12_205004.png\",\
\"http://ompldr.org/vYzEwcQ/wterm_2012-02-01_183109.png\",\
]
LICENSE  = GPL v3 Open Source
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
	echo "CC=${CROSS_COMPILE_$*}gcc" >> build/src/Makefile.inc
	echo "MARCH_TUNE=-O2 -march=armv7-a -mcpu=cortex-a8 -mfpu=neon -mfloat-abi=softfp" >> build/src/Makefile.inc
	echo "ROOT=${STAGING_DIR_$*}/usr" >> build/src/Makefile.inc
	cd build/src; ${MAKE} clean wterm
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
