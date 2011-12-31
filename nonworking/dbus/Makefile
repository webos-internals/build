NAME     = dbus
TITLE    = dbus
SRC_VER  = 1.4.16
VERSION  = 1.4.16-1
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
installpkgdir=${PWD}/build/$*

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	( cd build/src ; \
	CC="${CROSS_COMPILE_$*}gcc" \
	LDFLAGS="-Wl,-L${STAGING_DIR_$*}/usr/lib,-rpath-link,${STAGING_DIR_$*}/usr/lib -L${STAGING_DIR_$*}/usr/lib" \
	CFLAGS="-I${STAGING_DIR_$*}/usr/include" \
	PKG_CONFIG_PATH="${STAGING_DIR_$*}/usr/lib/pkgconfig" \
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-dbus-user=root \
		--with-system-socket="/var/run/dbus/system_bus_socket" \
		--with-system-pid-file="/var/run/dbus.pid" \
		--with-dbus-user=root \
		--disable-console-owner-file \
		--without-x \
		--host=${CONFIGURE_HOST_$*}; \
	${MAKE} clean all && make DESTDIR=${installpkgdir} install )
	rm -r build/$*/{usr/include,usr/lib/pkgconfig,usr/lib/*.la,var}
	mkdir -p build/$*/usr/palm/applications/${APP_ID}

	sed -i 's|/usr|/media/cryptofs/apps/usr/palm/applications/${APP_ID}|' build/$*/etc/dbus-1/system.conf

	rm build/$*/usr/lib/libdbus-1.so.3
	cp build/$*/usr/lib/libdbus-1.so.3.5.8 \
		build/$*/usr/lib/libdbus-1.so.3

	mv build/$*/usr/{bin,lib,libexec,share} build/$*/etc build/$*/usr/palm/applications/${APP_ID}

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
