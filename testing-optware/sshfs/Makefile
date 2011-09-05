NAME     = sshfs-fuse
TITLE	 = SFTP mounter using fuse
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
SRC_VER  = 2.3
VERSION  = 2.3
HOMEPAGE = http://fuse.sourceforge.net/sshfs.html
DESCRIPTION = mount SFTP file systems using fuse
CHANGELOG = \
2.3: initial port
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = 

SRC_TAR=http://downloads.sourceforge.net/project/fuse/sshfs-fuse/2.3/sshfs-fuse-2.3.tar.gz

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/bin
	cp -rp build/$*/usr/bin/* ../../staging/$*/usr/bin/
	touch $@

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -z -x -f $<
	mv build/${NAME}-${SRC_VER} build/src
	touch $@

${DL_DIR}/${NAME}-${VERSION}.tar.gz:
	cd ../../downloads && wget ${SRC_TAR}

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
	install -m 644 build/src/sshfs build/$*/usr/bin/
	touch $@

clobber::
	rm -rf build


