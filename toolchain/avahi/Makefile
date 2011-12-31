NAME     = avahi
TITLE    = avahi
SRC_VER  = 0.6.30
VERSION  = 0.6.30-1
APP_ID   = org.webosinternals.toolchain.${TITLE}
HOMEPAGE = http://avahi.org
MAINTAINER = Will Rea <will.rea@gmail.com>
DESCRIPTION = A multicast/unicast DNS-SD framework
LICENSE  = LGPL v2.1 Open Source
DEPENDS  = 

SRC_TGZ = http://avahi.org/download/avahi-${SRC_VER}.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk

include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv7 build/i686
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${SRC_VER} build/src
	touch $@

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

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk
installpkgdir=${PWD}/build/$*

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src ; \
	CC="${CROSS_COMPILE_$*}gcc" \
	CFLAGS="-I${STAGING_DIR_$*}/usr/include -I${STAGING_DIR_$*}/usr/include/gdbm -I${STAGING_DIR_$*}/usr/include/glib-2.0 \
		-I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	LDFLAGS="-Wl,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	PKG_CONFIG_PATH="${STAGING_DIR_$*}/usr/lib/pkgconfig" \
	DBUS_LIBS="-L${STAGING_DIR_$*}/usr/lib -ldbus-1" \
	DBUS_CFLAGS="-I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	GLIB20_LIBS="-L${STAGING_DIR_$*}/usr/lib -lglib-2.0" \
	GLIB20_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	GOBJECT_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	GOBJECT_LIBS="-L${STAGING_DIR_$*}/usr/lib -lgobject-2.0" \
	XML_CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	XML_LIBS="-L${STAGING_DIR_$*}/usr/lib -lexpat" \
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--with-avahi-priv-access-group=nogroup --with-avahi-user=nobody --with-avahi-group=nogroup \
		--with-autoipd-user=nogroup --with-autoipd-group=nogroup \
		--with-xml=expat --disable-monodoc --disable-stack-protector \
		--disable-python --disable-mono --with-distro=none --enable-compat-libdns_sd \
		--disable-qt3 --disable-qt4 --disable-gtk --disable-gtk3 \
		--disable-manpages --disable-xmltoman --host=${CONFIGURE_HOST_$*}; \
	${MAKE} )
	mkdir -p build/$*/usr/lib
	mkdir -p build/$*/usr/include/avahi-client
	install -m 644 build/src/avahi-client/client.h build/$*/usr/include/avahi-client
	install -m 644 build/src/avahi-client/lookup.h build/$*/usr/include/avahi-client
	install -m 644 build/src/avahi-client/publish.h build/$*/usr/include/avahi-client
	install -m 755 build/src/avahi-client/.libs/libavahi-client.so.3.2.9 build/$*/usr/lib
	install -m 755 build/src/avahi-client/.libs/libavahi-client.so.3.2.9 build/$*/usr/lib/libavahi-client.so.3
	install -m 755 build/src/avahi-client/.libs/libavahi-client.so.3.2.9 build/$*/usr/lib/libavahi-client.so
	install -m 755 build/src/avahi-client/.libs/libavahi-client.a build/$*/usr/lib
	mkdir -p build/$*/usr/include/avahi-common
	install -m 644 build/src/avahi-common/*.h build/$*/usr/include/avahi-common
	rm build/$*/usr/include/avahi-common/utf8.h
	install -m 755 build/src/avahi-common/.libs/libavahi-common.so.3.5.3 build/$*/usr/lib
	install -m 755 build/src/avahi-common/.libs/libavahi-common.so.3.5.3 build/$*/usr/lib/libavahi-common.so.3
	install -m 755 build/src/avahi-common/.libs/libavahi-common.so.3.5.3 build/$*/usr/lib/libavahi-common.so
	install -m 755 build/src/avahi-common/.libs/libavahi-common.a build/$*/usr/lib
	mkdir -p build/$*/usr/include/avahi-core
	install -m 644 build/src/avahi-core/*.h build/$*/usr/include/avahi-core
	install -m 755 build/src/avahi-core/.libs/libavahi-core.so.7.0.2 build/$*/usr/lib
	install -m 755 build/src/avahi-core/.libs/libavahi-core.so.7.0.2 build/$*/usr/lib/libavahi-core.so.7
	install -m 755 build/src/avahi-core/.libs/libavahi-core.so.7.0.2 build/$*/usr/lib/libavahi-core.so
	install -m 755 build/src/avahi-core/.libs/libavahi-core.a build/$*/usr/lib
	mkdir -p build/$*/usr/include/avahi-glib
	install -m 644 build/src/avahi-glib/*.h build/$*/usr/include/avahi-glib
	install -m 755 build/src/avahi-glib/.libs/libavahi-glib.so.1.0.2 build/$*/usr/lib
	install -m 755 build/src/avahi-glib/.libs/libavahi-glib.so.1.0.2 build/$*/usr/lib/libavahi-glib.so.1
	install -m 755 build/src/avahi-glib/.libs/libavahi-glib.so.1.0.2 build/$*/usr/lib/libavahi-glib.so
	install -m 755 build/src/avahi-glib/.libs/libavahi-glib.a build/$*/usr/lib
	mkdir -p build/$*/usr/include/avahi-gobject
	install -m 644 build/src/avahi-gobject/*.h build/$*/usr/include/avahi-gobject
	install -m 755 build/src/avahi-gobject/.libs/libavahi-gobject.so.0.0.4 build/$*/usr/lib
	install -m 755 build/src/avahi-gobject/.libs/libavahi-gobject.so.0.0.4 build/$*/usr/lib/libavahi-gobject.so.0
	install -m 755 build/src/avahi-gobject/.libs/libavahi-gobject.so.0.0.4 build/$*/usr/lib/libavahi-gobject.so
	install -m 755 build/src/avahi-gobject/.libs/libavahi-gobject.a build/$*/usr/lib
	mkdir build/$*/usr/lib/pkgconfig
	install -m 644 build/src/*.pc build/$*/usr/lib/pkgconfig
	( cd build/src ; ${MAKE} clean )
	touch $@

clobber::
	rm -rf build
