NAME     = termplugin
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.1.9
HOMEPAGE = http://www.preware.org/wiki/Application:Terminal
MAINTAINER = WebOS Internals <support@webos-internal.org>
DESCRIPTION = Terminal Service Plugin
SECTION = libs

SRC_GIT = git://gitorious.org/webos-internals/applications.git
include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build build.tmp
	mkdir -p build.tmp
	tar -C build.tmp -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mkdir -p build/armv7 build/i686
	cp -r build.tmp/${NAME} build/src
	rm -rf build.tmp
	touch $@

build/.built: build/armv7.built build/i686.built
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

build/armv7/CONTROL/postinst:
	rm -f $@
	mkdir -p build/armv7/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "ln -s /var/usr/lib/BrowserPlugins/${NAME}.so /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

build/i686/CONTROL/postinst:
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "ln -s /var/usr/lib/BrowserPlugins/${NAME}.so /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

build/armv7/CONTROL/prerm:
	rm -f $@
	mkdir -p build/armv7/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

build/i686/CONTROL/prerm:
	rm -f $@
	mkdir -p build/${NAME}/CONTROL
	echo "#!/bin/sh" > $@
	echo "rm -f /usr/lib/BrowserPlugins/${NAME}.so" >> $@
	echo "exit 0" >> $@
	chmod ugo+x $@

include ../../support/plugin-package.mk

clobber::
	rm -rf build
