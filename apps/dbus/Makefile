NAME     = dbus
TITLE    = dbus
SRC_VER  = 1.4.16
VERSION  = 1.4.16-3
APP_ID   = org.webosinternals.${NAME}
HOMEPAGE = http://dbus.freedesktop.org
MAINTAINER = Will Rea <will.rea@gmail.com>
DESCRIPTION = Freedesktop.org message bus system
TYPE	 = Linux Daemon
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_Base_Patch.png
LICENSE  = GPL v2 / AFL 2.1
MINWEBOSVERSION = 2.0
CHANGELOG = \
1.4.16-3 More packaging fixes \
1.4.16-2 Fixed packaging \
1.4.16-1 Initial Release

SRC_TGZ = http://dbus.freedesktop.org/releases/dbus/dbus-${SRC_VER}.tar.gz

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

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src ; \
	CC="${CROSS_COMPILE_$*}gcc" \
	LDFLAGS="-Wl,-L${STAGING_DIR_$*}/usr/lib,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	PKG_CONFIG_PATH="${STAGING_DIR_$*}/usr/lib/pkgconfig" \
	GLIB_CFLAGS="-I${STAGING_DIR_$*}/usr/include/glib-2.0" \
	GLIB_LIBS="-L${STAGING_DIR_$*}/usr/lib -lglib-2.0" \
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-dbus-user=root \
		--with-system-socket="/var/run/dbus/system_bus_socket" \
		--with-system-pid-file="/var/run/dbus.pid" \
		--with-dbus-user=root \
		--disable-console-owner-file \
		--enable-fast-install \
		--without-x \
		--host=${CONFIGURE_HOST_$*}; \
	${MAKE} clean all )
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/bus/dbus-daemon build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/tools/dbus-cleanup-sockets build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/tools/dbus-launch build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/tools/dbus-monitor build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/tools/dbus-send build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/tools/dbus-uuidgen build/$*/usr/palm/applications/${APP_ID}/bin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/etc/dbus-1
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/etc/dbus-1/session.d
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/etc/dbus-1/system.d
	install -m 644 build/src/bus/session.conf build/$*/usr/palm/applications/${APP_ID}/etc/dbus-1
	install -m 644 build/src/bus/system.conf build/$*/usr/palm/applications/${APP_ID}/etc/dbus-1
	sed -i 's|/usr|/media/cryptofs/apps/usr/palm/applications/${APP_ID}|' build/$*/usr/palm/applications/${APP_ID}/etc/dbus-1/system.conf
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/lib
	install -m 755 build/src/dbus/.libs/*-1.a build/$*/usr/palm/applications/${APP_ID}/lib
	install -m 755 build/src/dbus/.libs/*-1.so* build/$*/usr/palm/applications/${APP_ID}/lib
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/libexec
	install -m 755 build/src/bus/dbus-daemon-launch-helper build/$*/usr/palm/applications/${APP_ID}/libexec
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/share
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/share/dbus-1
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/share/dbus-1/services
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/share/dbus-1/system-services
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/share/doc/dbus
	install -m 644 build/src/doc/*.html build/$*/usr/palm/applications/${APP_ID}/share/doc/dbus
	install -m 644 build/src/doc/system-activation.txt build/$*/usr/palm/applications/${APP_ID}/share/doc/dbus
	install -m 644 build/src/doc/diagram.* build/$*/usr/palm/applications/${APP_ID}/share/doc/dbus
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/share/man/man1
	cp build/src/doc/*.1 build/$*/usr/palm/applications/${APP_ID}/share/man/man1
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/share/dbus-1
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 664 upstart/org.webosinternals.dbus build/$*/usr/palm/applications/${APP_ID}/upstart
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
