NAME     = avahi
TITLE    = avahi
SRC_VER  = 0.6.30
VERSION  = 0.6.30-1
APP_ID   = org.webosinternals.${TITLE}
HOMEPAGE = http://avahi.org
MAINTAINER = Will Rea <will.rea@gmail.com>
DESCRIPTION = A multicast/unicast DNS-SD framework
TYPE	 = Linux Daemon
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = LGPL v2.1 Open Source
DEPENDS  = org.webosinternals.libdaemon org.webosinternals.dbus
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS = RestartDevice
CHANGELOG = \
0.6.30-1 Intital Release

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

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

INSTALL_PREFIX=$(shell pwd)/build/$*

LIBC_PATH_armv7 = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/arm-none-linux-gnueabi/libc/usr/lib
LIBC_PATH_i686  = $(shell cd ../.. ; pwd)/toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/i686-unknown-linux-gnu/sys-root/usr/lib

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
	PTHREAD_LIBS="-L${LIBC_PATH_$*} -lpthread" \
	DBUS_CFLAGS="-I${STAGING_DIR_$*}/usr/include/dbus-1.0" \
	DBUS_LIBS="-L${STAGING_DIR_$*}/usr/lib -ldbus-1" \
	GLIB20_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	GLIB20_LIBS="-L${STAGING_DIR_$*}/usr/lib -lglib-2.0" \
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
	${MAKE} && make DESTDIR=${INSTALL_PREFIX} install )
	# Cleanup
	rm -r build/$*/usr/share/applications
	rm -r build/$*/usr/share/locale
	rm -r build/$*/usr/share/man
	rm -r build/$*/usr/lib/avahi
	rm -r build/$*/usr/lib/pkgconfig
	rm -r build/$*/usr/lib/*.la
	rm -r build/$*/var 
	rm -r build/$*/usr/include
	rm -r build/$*/etc/avahi/services/*
 	# Move DBus files
	mkdir -p build/$*/usr/palm/applications/org.webosinternals.dbus/etc
	mkdir -p build/$*/usr/palm/applications/org.webosinternals.dbus/share
	mv -f build/$*/usr/share/dbus-1 build/$*/usr/palm/applications/org.webosinternals.dbus/share
	mv -f build/$*/etc/dbus-1 build/$*/usr/palm/applications/org.webosinternals.dbus/etc
	cp build/src/avahi-daemon/org.freedesktop.Avahi.service build/$*/usr/palm/applications/org.webosinternals.dbus/share/dbus-1/system-services
	# Symlinks seemed to disappear when installed on device, lets just make them actual files instead
	rm build/$*/usr/lib/libavahi-common.so.3 build/$*/usr/lib/libavahi-client.so.3 build/$*/usr/lib/libavahi-core.so.7
	cp build/$*/usr/lib/libavahi-common.so.3.* build/$*/usr/lib/libavahi-common.so.3
	cp build/$*/usr/lib/libavahi-client.so.3.* build/$*/usr/lib/libavahi-client.so.3
	cp build/$*/usr/lib/libavahi-core.so.7.* build/$*/usr/lib/libavahi-core.so.7
	#Edit avahi-daemon.conf
	sed -i 's/#enable-dbus/enable-dbus/' build/$*/etc/avahi/avahi-daemon.conf
	mkdir build/$*/usr/palm/applications/${APP_ID}
	mv build/$*/etc build/$*/usr/palm/applications/${APP_ID}
	mv build/$*/usr/bin build/$*/usr/palm/applications/${APP_ID}
	mv build/$*/usr/sbin build/$*/usr/palm/applications/${APP_ID}
	mv build/$*/usr/lib build/$*/usr/palm/applications/${APP_ID}
	mv build/$*/usr/share build/$*/usr/palm/applications/${APP_ID}
	# Install upstart script
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 664 upstart/org.webosinternals.avahi-daemon build/$*/usr/palm/applications/${APP_ID}/upstart
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
