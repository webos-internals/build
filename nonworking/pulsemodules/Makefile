NAME     = pulseaudio-modules
TITLE    = Additional PulseAudio Modules
APP_ID   = org.webosinternals.${NAME}
SRC_VER  = 0.9.22
VERSION  = 0.9.22-1
MAINTAINER = Will Rea <will.rea@gmail.com>
HOMEPAGE = http://pulseaudio.org
TYPE     = Linux Library
CATEGORY = Utilities
ICON     = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
DESCRIPTION = This package provides additional PulseAudio modules. You might want to install the PulseAudio Settings app to utilize these new modules.
LICENSE  = GPL v2 Open Source
MINWEBOSVERSION = 2.2.0
MAXWEBOSVERSION = 3.0.5
DEPENDS  = org.webosinternals.avahi
CHANGELOG = \
0.9.22-1 Initial Release
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS = RestartDevice

SRC_TGZ = http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${SRC_VER}.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk

include ../../support/package.mk

include ../../support/download.mk

.PHONY: stage
stage: build/.staged-${VERSION}

build/.staged-${VERSION}: build/armv7.staged-${VERSION}
	touch $@

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv7
	tar -C build -z -x -f $<
	mv build/pulseaudio-${SRC_VER} build/src
	patch -d build/src -p0 -i ../../patches/pulseaudio-${SRC_VER}-patch
	patch -d build/src -p0 -i ../../patches/config.patch
	patch -d build/src -p1 -i ../../patches/raop-buffer.patch
	patch -d build/src -p1 -i ../../patches/palm-policy.patch

	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} #build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src ;\
	  sed -i 's/man po/man/' Makefile.am ;\
	  CC="${CROSS_COMPILE_$*}gcc" \
	  NM="${CROSS_COMPILE_$*}nm" \
	  CFLAGS="-march=armv7-a -I${STAGING_DIR_$*}/usr/include -I${STAGING_DIR_$*}/usr/include/gdbm -I${STAGING_DIR_$*}/usr/include/alsa -I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	  LDFLAGS="-Wl,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	  PKG_CONFIG_PATH="${STAGING_DIR_$*}/usr/lib/pkgconfig" \
	  DBUS_CFLAGS="-I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	  DBUS_LIBS="-L${STAGING_DIR_$*}/usr/lib -ldbus-1.0" \
	  GLIB20_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	  GLIB20_LIBS="-L${STAGING_DIR_$*}/usr/lib -lglib-2.0" \
	  LIBSNDFILE_CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	  LIBSNDFILE_LIBS="-L${STAGING_DIR_$*}/usr/lib -lsndfile" \
	  LIBSPEEX_LIBS="-L${STAGING_DIR_$*}/usr/lib -lspeex -lspeexdsp" \
	  LIBSPEEX_CFLAGS="-I${STAGING_DIR_$*}/usr/include/speex" \
	  LIBOIL_CFLAGS="-I${STAGING_DIR_$*}/usr/include/liboil" \
	  LIBOIL_LIBS="-L${STAGING_DIR_$*}/usr/lib -loil-0.3" \
	  AVAHI_CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	  AVAHI_LIBS="-L${STAGING_DIR_$*}/usr/lib -lavahi-common -lavahi-client" \
	  OPENSSL_CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	  OPENSSL_LIBS="-L${STAGING_DIR_$*}/usr/lib -lssl -lcrypto" \
	  ./bootstrap.sh --prefix=/usr --enable-ltdl-install=no --disable-manpages --host=${CONFIGURE_HOST_$*} ;\
	  ${MAKE} V=1 all )
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-raop*.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-zeroconf*.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-rtp*.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-palm-policy.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-native-protocol-tcp.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-tunnel-sink.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/libavahi-wrap.so build/$*/usr/palm/applications/${APP_ID}
	install -m 755 build/src/src/.libs/librtp.so build/$*/usr/palm/applications/${APP_ID}
	install -m 755 build/src/src/.libs/libraop.so build/$*/usr/palm/applications/${APP_ID}
	touch $@


#	  LDFLAGS="-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.avahi/lib \
#		-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.pulseaudio-modules \
#		-Wl,-R/usr/lib/pulse-0.9.22 \
#		-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.dbus/lib \
#		-L${STAGING_DIR_$*}/usr/lib,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \

clobber::
	rm -rf build
