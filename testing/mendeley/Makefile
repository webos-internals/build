NAME     = mendeley
TITLE    = Mendeley
APP_ID   = us.ryanhope.${NAME}
VERSION  = 0.0.2
TYPE     = Application
BLDFLAGS = -p
CATEGORY = Productivity
MAINTAINER = Ryan Hope <PuffTheMagic>
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Mendeley
ICON     = http://git.webos-internals.org/enyo/mendeley/plain/images/icon-64.png
DESCRIPTION = A native webOS/Enyo Mendeley client for the HP Touchpad. <b><font color=red>THIS PROGRAM IS HIGHLY ALPHA; IT IS IN CONSTANT FLUX AND THE OPEN MENDELEY API IS CONSTANTLY CHANGING. EXPECT BUGS!</font></b>

SCREENSHOTS = [\"http://www.webos-internals.org/images/e/e3/Mendeley1.png\"]
LICENSE  = GPL v2 Open Source
MINWEBOSVERSION = 3.0.0

SRC_GIT = git://git.webos-internals.org/enyo/mendeley.git

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
	( cd build/src ; \
		${MAKE} ROOT=${STAGING_DIR_$*} PREFIX=/usr CC=${CROSS_COMPILE_$*}gcc \
                clobber build-plugin ; \
		rm -rf .* ; \
		rm -rf Makefile ; \
		rm -rf plugin/libpdl ; \
		rm -rf plugin/*.c ; \
		rm -rf plugin/*.h ; \
		rm -rf plugin/*.o ; \
		rm -rf plugin/*.a ; \
		rm -rf plugin/*.inc ; \
		rm -rf plugin/Makefile )
	mkdir -p ${D}
	install -m 755 build/src/plugin/${NAME} ${D}
	cp -r build/src/* ${D}
	rm -rf ${D}/src
	touch $@

clobber::
	rm -rf build
