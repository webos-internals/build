NAME     = upstartmgr
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.0.8
CHANGELOG = 0.0.8: Now supports installation via palm-install.<br>0.0.7: Added the jps method for the new Upstart Manager application to use.  Fixed the installation of the dbus service description.
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
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/sbin
	install -m 755 build/src/${NAME} build/$*/usr/sbin/${APP_ID}
	mkdir -p build/$*/usr/share/dbus-1/system-services
	install -m 644 build/src/${APP_ID}.service build/$*/usr/share/dbus-1/system-services/
	mkdir -p build/$*/etc/event.d
	install -m 644 build/src/upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
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
