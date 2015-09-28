NAME     = pulseaudio
TITLE    = pulseaudio
APP_ID   = org.webosinternals.toolchain.${NAME}
SRC_VER  = 0.9.22
VERSION  = 0.9.22-1
MAINTAINER = WebOS Internals <support@webos-internals.org>

SRC_TGZ = http://downloads.help.palm.com/opensource/3.0.0/${NAME}-${SRC_VER}.tgz

.PHONY: package
package: build/.built-${VERSION}

include ../../support/download.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION} build/armv6.staged-${VERSION} build/i686.staged-${VERSION}
	touch $@

build/%.staged-${VERSION} : build/%.built-${VERSION}
	mkdir -p ../../staging/$*/usr/include
	cp -rp build/$*/usr/include/* ../../staging/$*/usr/include/
	mkdir -p ../../staging/$*/usr/lib
	cp -rp build/$*/usr/lib/* ../../staging/$*/usr/lib/
	touch $@

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv6 build/armv7 build/i686
	tar -C build -z -x -f $<
	mv build/${NAME}-${SRC_VER} build/src
	patch -d build/src -p0 -i ../../patches/pulseaudio-${SRC_VER}-patch
	patch -d build/src -p0 -i ../../patches/config.patch
	patch -d build/src -p1 -i ../../patches/raop-buffer.patch
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  sed -i 's/man po/man/' Makefile.am ; \
	  CC="${CROSS_COMPILE_$*}gcc" \
	  NM="${CROSS_COMPILE_$*}nm" \
	  CHOST="$*" \
	  LIBSNDFILE_CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	  LIBSNDFILE_LIBS="-L${STAGING_DIR_$*}/usr/lib -lsndfile" \
	  LIBSPEEX_LIBS="-L${STAGING_DIR_$*}/usr/lib -lspeex -lspeexdsp" \
	  LIBSPEEX_CFLAGS="-I${STAGING_DIR_$*}/usr/include/speex" \
	  LIBOIL_CFLAGS="-I${STAGING_DIR_$*}/usr/include/liboil" \
	  LIBOIL_LIBS="-L${STAGING_DIR_$*}/usr/lib -loil-0.3" \
	  GLIB20_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	  GLIB20_LIBS="-L${STAGING_DIR_$*}/usr/lib -lglib-2.0" \
	  LIBSAMPLERATE_CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	  LIBSAMPLERATE_LIBS="-L${STAGING_DIR_$*}/usr/lib -lsamplerate" \
	  CFLAGS="-I${STAGING_DIR_$*}/usr/include -I${STAGING_DIR_$*}/usr/include/gdbm -I${STAGING_DIR_$*}/usr/include/alsa" \
	  LDFLAGS="-Wl,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	  ./bootstrap.sh \
	  	--host=${CONFIGURE_HOST_$*} \
		--enable-ltdl-install=no \
		--without-x \
		--disable-rpath \
		--disable-static \
		--disable-dbus \
		--disable-gconf \
		--disable-oss \
		--disable-solaris \
		--disable-avahi \
		--disable-jack \
		--disable-asyncns \
		--disable-tcpwrap \
		--disable-lirc \
		--disable-hal \
		--disable-bluez \
		--disable-udev \
		--disable-polkit \
		--disable-gtk2 ; \
	  ${MAKE} clean all )
	mkdir -p build/$*/usr/include/pulse
	install -m 644 build/src/src/pulse/*.h build/$*/usr/include/pulse/
	mkdir -p build/$*/usr/lib/pulse/modules
	install -m 755 build/src/src/.libs/module*.so* build/$*/usr/lib/pulse/modules/
	rm build/src/src/.libs/module*.so*
	install -m 755 build/src/src/.libs/*.so* build/$*/usr/lib/pulse/
	touch $@

clobber::
	rm -rf build
