NAME     = wirc
TITLE    = wIRC
APP_ID   = org.webosinternals.${EXTRAID}${NAME}
VERSION  = 0.4.7
TYPE     = Application
BLDFLAGS = -p
CATEGORY = Communication
MAINTAINER = oil, PuffTheMagic
HOMEPAGE = http://www.webos-internals.org/wiki/Application:WIRC
ICON     = http://www.webos-internals.org/images/1/10/Icon_WebOSInternals_wIRC.png
DESCRIPTION = A native webOS IRC client. <b><font color=red>THIS ONLY WORKS with webOS >=1.4.5, and you MUST run the Emergency Fstab Fixer or have corrected your /etc/fstab file by some other method.</font></b>
CHANGELOG = \
0.4.7: Pre3 screen size fixes<br>\
0.4.6: Fix prefered interface and possibly a connection bug <br>\
0.4.5: Work at touchpad resolution <br>\
0.4.0: Tons of fixes and updates and a new theme <br>\
0.3.11: Get appid from mojo instead of hardcoding it <br>\
0.3.10: Plugin bug fix and Font Style Preference <br>\
0.3.9: Add ability to run without SSL support for initial catalog submission <br>\
0.3.8: Bunch of bug fixes and webOS 2.x updates <br>\
0.3.7: Misc bugfixes <br>\
0.3.6: Another attempt at a fix for "wIRC stays open after closing" bug <br>\
0.3.5: Hackish fix for "wIRC stays open after closing" bug <br>\
0.3.4: Bugfixes. <br>\
0.3.3: TLS encryption, random bug fixes <br>\
0.3.2: Bugfixes and beta SSL support.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5a/Wirc.png\",\
\"http://www.webos-internals.org/images/d/d2/Wirc_2.png\",\
\"http://www.webos-internals.org/images/b/b6/Wirc_3.png\",\
\"http://www.webos-internals.org/images/7/7c/Wirc_4.png\",\
\"http://www.webos-internals.org/images/9/9d/Wirc_5.png\" ]
LICENSE  = GPL v2 Open Source
MINWEBOSVERSION = 1.4.5

ifeq ($(SSL),)
	SSL=1
endif

GIT_TAG = v0.4.7
SRC_GIT = git://github.com/webos-internals/wIRC.git

D = build/$*/usr/palm/applications/${APP_ID}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

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

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

#CROSS_COMPILE_arm = $(shell cd ../.. ; pwd)/toolchain/cs09q1armel/build/arm-2009q1/bin/arm-none-linux-gnueabi-

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src/src/libpdl ; rm -f *.o ; rm -f *.so ; cd .. ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc SSL=${SSL}\
		clobber ${NAME} )
	mkdir -p ${D}
	${CROSS_COMPILE_$*}strip build/src/src/wirc
	install -m 755 build/src/src/${NAME} ${D}
	cp -r build/src/* ${D}
	rm -rf ${D}/src
	touch $@

clobber::
	rm -rf build
