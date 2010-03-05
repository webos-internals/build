NAME     = upstartmgr
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.0.7
CHANGELOG = 0.0.7: Added the jps method for the new Upstart Manager application to use.  Fixed the installation of the dbus service description.
MAINTAINER = WebOS Internals <support@webos-internals.org>
TITLE    = Upstart Manager Service
DESCRIPTION = The Upstart Manager Service is a back-end interface to the initctl command line application which manages the background Linux daemons that run on a webOS Device.  It is required for launching advanced homebrew applications like DOOM! and OpenVPN.
TYPE	 = Service
CATEGORY = Luna
ICON	= http://www.webos-internals.org/images/b/bc/Icon_WebOSInternals_UpstartService.png
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/services/upstartmgr.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built build/armv6.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	( cd build/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/i686 CC=gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/i686/usr/sbin
	install -m 755 build/src/${NAME} build/i686/usr/sbin/${APP_ID}
	mkdir -p build/i686/usr/share/dbus-1/system-services
	install -m 644 build/src/${APP_ID}.service build/i686/usr/share/dbus-1/system-services/
	mkdir -p build/i686/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/i686/etc/event.d/${APP_ID}
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	( cd build/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/armv7 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/armv7/usr/sbin
	install -m 755 build/src/${NAME} build/armv7/usr/sbin/${APP_ID}
	mkdir -p build/armv7/usr/share/dbus-1/system-services
	install -m 644 build/src/${APP_ID}.service build/armv7/usr/share/dbus-1/system-services/
	mkdir -p build/armv7/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/armv7/etc/event.d/${APP_ID}
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	( cd build/src ; \
	  ${MAKE} STAGING_DIR=$(shell cd ../.. ; pwd)/staging/armv7 \
	  CC=$(shell cd ../.. ; pwd)/toolchain/cs08q1armel/build/arm-2008q1/bin/arm-none-linux-gnueabi-gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/armv6/usr/sbin
	install -m 755 build/src/${NAME} build/armv6/usr/sbin/${APP_ID}
	mkdir -p build/armv6/usr/share/dbus-1/system-services
	install -m 644 build/src/${APP_ID}.service build/armv6/usr/share/dbus-1/system-services/
	mkdir -p build/armv6/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/armv6/etc/event.d/${APP_ID}
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
