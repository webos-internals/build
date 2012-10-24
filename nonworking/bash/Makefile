NAME     = bash
TITLE    = Bash
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
MAJOR = 4
MINOR = 2
SRC_VER  = ${MAJOR}.${MINOR}
PATCH_VER = 20
VERSION  = ${SRC_VER}.${PATCH_VER}-1
HOMEPAGE = http://www.info-zip.org/
MAINTAINER = Ryan Hope
DESCRIPTION = Bash is an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and C shell (csh). It is intended to conform to the IEEE POSIX P1003.2/ISO 9945.2 Shell and Tools standard. It offers functional improvements over sh for both programming and interactive use.
TYPE	 = Linux Application
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/a7/Icon_WebOSInternals_Box.png
LICENSE  = GPL-3

BASE_URI = ftp://mirrors.kernel.org/gnu/${NAME}
SRC_TGZ = ${BASE_URI}/${NAME}-${SRC_VER}.tar.gz

PATCH_BASE_URI = ${BASE_URI}/${NAME}-${SRC_VER}-patches
PATCH_FILE_BASE = ${NAME}${MAJOR}${MINOR}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${SRC_VER} build/src
	for NUM in `seq ${PATCH_VER}`; do \
		FILE=`printf "%s-%03d" "${PATCH_FILE_BASE}" "$${NUM}"`; \
		URL=`printf "%s/%s" "${PATCH_BASE_URI}" "$${FILE}"`; \
		if [ ! -e ${DL_DIR}/$${FILE} ]; then \
			${MAKE} SRC_FILE=$${URL} LOCAL_FILE=$${FILE} download; \
		fi; \
		echo "Applying patch $${FILE}"; \
		patch -d build/src -p2 < ${DL_DIR}/$${FILE}; \
	done
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
		CC=${CROSS_COMPILE_$*}gcc \
		CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
		LDFLAGS="-L${STAGING_DIR_$*}/usr/lib" \
		./configure \
			--target=${CONFIGURE_HOST_$*} \
			--host=${CONFIGURE_HOST_$*}; \
		${MAKE} clean all )
	mkdir -p build/$*/etc/bash
	mkdir -p build/$*/bin
	install -m 644 build/src/bash build/$*/bin/
	touch $@

clobber::
	rm -rf build
