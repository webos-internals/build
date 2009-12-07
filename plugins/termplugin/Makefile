NAME     = termplugin
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
VERSION  = 0.2.3
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Terminal
MAINTAINER = WebOS Internals <support@webos-internals.org>
TITLE = Terminal Service Plugin
TYPE = Plugin
CATEGORY = Browser
DESCRIPTION = The Terminal Service Plugin is a back-end binary browser plugin providing the core of the Terminal application.  It does not have an icon, and cannot be launched - it can only be used by another application.
CHANGELOG = 0.2.3: Updated for future webOS compatibility.
ICON	 = http://www.webos-internals.org/images/6/68/Icon_WebOSInternals_TerminalService.png
LICENSE  = GPL v2 Open Source
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna

SRC_GIT = git://git.webos-internals.org/plugins/termplugin.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src build/armv7 build/armv6 build/i686
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/armv7.built build/armv6.built build/i686.built
	touch $@

build/i686.built: build/.unpacked
	rm -rf build/i686
	${MAKE} -C build/src
	mkdir -p build/i686/usr/lib/BrowserPlugins/
	install -m 644 build/src/${NAME}.so build/i686/usr/lib/BrowserPlugins/
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	mkdir -p build/src/pre-out
	${MAKE} -C build/src PRE_DEV_DIR=`pwd`/../../toolchain/cs08q1armel/build/arm-2008q1 pre-out/${NAME}.so
	mkdir -p build/armv7/usr/lib/BrowserPlugins/
	install -m 644 build/src/pre-out/${NAME}.so build/armv7/usr/lib/BrowserPlugins/
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	mkdir -p build/src/pre-out
	${MAKE} -C build/src PRE_DEV_DIR=`pwd`/../../toolchain/cs08q1armel/build/arm-2008q1 pre-out/${NAME}.so
	mkdir -p build/armv6/usr/lib/BrowserPlugins/
	install -m 644 build/src/pre-out/${NAME}.so build/armv6/usr/lib/BrowserPlugins/
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "cp "'$$'"IPKG_OFFLINE_ROOT/usr/lib/BrowserPlugins/${NAME}.so /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

build/%/CONTROL/prerm:
	rm -f $@
	mkdir -p build/$*/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

clobber::
	rm -rf build
