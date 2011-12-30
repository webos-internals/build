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

build/.unpacked-${VERSION}: ${DL_DIR}/pulseaudio-${SRC_VER}.tar.gz
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
	  mkdir libltdl ;\
	  ln -s ${STAGING_DIR_$*}/usr/lib/libltdl.* libltdl ;\
	  sed -i 's/--ldtl//' bootstrap.sh ;\
	  sed -i 's/man po/man/' Makefile.am ;\
	  CC=${CROSS_COMPILE_$*}gcc \
	  CFLAGS="-march=armv7-a -I${STAGING_DIR_$*}/usr/include -I${STAGING_DIR_$*}/usr/include/gdbm -I${STAGING_DIR_$*}/usr/include/alsa -I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	  LDFLAGS="-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.avahi/lib \
		-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.pulseaudio-modules \
		-Wl,-R/usr/lib/pulse-0.9.22 \
		-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.dbus/lib \
		-L${STAGING_DIR_$*}/usr/lib,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	  PKG_CONFIG_PATH="${STAGING_DIR_$*}/usr/lib/pkgconfig" \
	  DBUS_CFLAGS="-I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	  GLIB20_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	  LIBSPEEX_CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	  lt_cv_path_NM="/usr/bin/nm" \
	  ./bootstrap.sh --prefix=/usr --disable-manpages --host=${CONFIGURE_HOST_$*} ;\
	  ${MAKE} all )
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-{raop,zeroconf,rtp}*.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/module-palm-policy.so build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/{module-native-protocol-tcp.so,module-tunnel-sink.so} build/$*/usr/palm/applications/${APP_ID}/modules
	install -m 755 build/src/src/.libs/{libavahi-wrap.so,librtp.so,libraop.so} build/$*/usr/palm/applications/${APP_ID}
	touch $@

clobber::
	rm -rf build
