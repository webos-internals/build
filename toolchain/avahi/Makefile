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
	LDFLAGS="-Wl,-R/usr/lib -Wl,-R/lib -Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.libdaemon/lib \
		-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.dbus/lib \
		-Wl,-R/media/cryptofs/apps/usr/palm/applications/org.webosinternals.avahi/lib \
		-L${STAGING_DIR_$*}/usr/lib,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	PKG_CONFIG_PATH="${STAGING_DIR_$*}/usr/lib/pkgconfig" \
	DBUS_LIBS="-L${STAGING_DIR_$*}/usr/lib" \
	DBUS_CFLAGS="-I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	GLIB20_LIBS="-L${STAGING_DIR_$*}/usr/lib" \
	GLIB20_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	GOBJECT_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	GOBJECT_LIBS="-L${STAGING_DIR_$*}/usr/lib" \
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--with-avahi-priv-access-group=nogroup --with-avahi-user=nobody --with-avahi-group=nogroup \
		--with-autoipd-user=nogroup --with-autoipd-group=nogroup \
		--with-xml=expat --disable-monodoc --disable-stack-protector \
		--disable-python --disable-mono --with-distro=none --enable-compat-libdns_sd \
		--disable-qt3 --disable-qt4 --disable-gtk --disable-gtk3 \
		--disable-manpages --disable-xmltoman --host=${CONFIGURE_HOST_$*}; \
	PATH="${STAGING_DIR_$*}/usr/bin:${PATH}" ${MAKE} V=1 )
	rm -r build/$*/usr/bin
	touch $@

clobber::
	rm -rf build
