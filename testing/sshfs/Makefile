NAME     = sshfs
TITLE	 = Secure Shell Filesystem
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
SRC_VER  = 2.3
VERSION  = 2.3
HOMEPAGE = http://fuse.sourceforge.net/sshfs.html
DESCRIPTION = SSHFS allows you to mount remote SFTP file systems
CHANGELOG = \
2.3: initial port
TYPE	 = Linux Application
CATEGORY = Utilities

SRC_TGZ=http://downloads.sourceforge.net/project/fuse/sshfs-fuse/2.3/sshfs-fuse-2.3.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${SRC_VER}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -z -x -f $<
	mv build/${NAME}-fuse-${SRC_VER} build/src
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
	  CFLAGS="-I${STAGING_DIR_$*}/usr/include -I${STAGING_DIR_$*}/usr/include/glib-2.0 -I${STAGING_DIR_$*}/usr/include/glib-2.0/glib -I${STAGING_DIR_$*}/usr/include/fuse" \
	  LDFLAGS="-Wl,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	  PKG_CONFIG_PATH="${STAGING_DIR_$*}/usr/lib/pkgconfig"\
	  ./configure \
	  	--host=${CONFIGURE_HOST_$*} \
		--prefix=${STAGING_DIR_$*}/usr; \
	  ${MAKE} clean all )
	mkdir -p build/$*/usr/bin
	install -m 644 build/src/${NAME} build/$*/usr/bin/
	touch $@

clobber::
	rm -rf build


