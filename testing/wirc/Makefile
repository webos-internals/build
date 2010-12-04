NAME     = wirc
TITLE    = wIRC
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.3.4-1
TYPE     = Application
BLDFLAGS = -p
CATEGORY = Communication
MAINTAINER = oil, PuffTheMagic, zsoc, egaudet, rwhitby
HOMEPAGE = http://www.webos-internals.org/wiki/Application:WIRC
ICON     = http://www.webos-internals.org/images/1/10/Icon_WebOSInternals_wIRC.png
DESCRIPTION = A native webOS IRC client. <b><font color=red>THIS ONLY WORKS with webOS >=1.4.5, and you MUST run the Emergency Fstab Fixer or have corrected your /etc/fstab file by some other method.</font></b>
CHANGELOG = \
0.3.4-1: Possible Pixi support. <br>\
0.3.4: Bugfixes. <br>\
0.3.3: TLS encryption, random bug fixes <br>\
0.3.2: Bugfixes and beta SSL support. <br>\
0.3.1: Bugfixes.
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5a/Wirc.png\",\
\"http://www.webos-internals.org/images/d/d2/Wirc_2.png\",\
\"http://www.webos-internals.org/images/b/b6/Wirc_3.png\",\
\"http://www.webos-internals.org/images/7/7c/Wirc_4.png\",\
\"http://www.webos-internals.org/images/9/9d/Wirc_5.png\" ]
LICENSE  = GPL v2 Open Source
MINWEBOSVERSION = 1.4.5
DEVICECOMPATIBILITY = [\"Pre\",\"Pre2\",\"Pixi\"]

SRC_GIT = git://git.webos-internals.org/applications/wIRC.git
GIT_TAG = v0.3.4

D = build/$*/usr/palm/applications/${APP_ID}

.PHONY: package
package: pkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk

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

build/.built-${VERSION}: build/armv6.built-${VERSION} build/armv7.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src/src/libpdl ; rm -f *.o ; rm -f *.so ; cd .. ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
		clobber ${NAME} )
	mkdir -p ${D}
	install -m 755 build/src/src/${NAME} ${D}
	cp -r build/src/* ${D}
	rm -rf ${D}/src
	touch $@

clobber::
	rm -rf build
