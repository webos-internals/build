NAME     = terminal
TITLE	 = Terminal
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
BLDFLAGS = -p
VERSION  = 0.3.2
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Terminal
ICON	 = http://www.webos-internals.org/images/7/74/Icon_WebOSInternals_Terminal.png
DESCRIPTION = Command line terminal for webOS.
CHANGELOG = 0.3.2: Added support for paste.<br>0.3.1: Added access to more special keys.<br>0.3.0: Subsumed the Terminal Service Plugin into this package.<br>0.2.3: Added help page for key mappings and detection of the termplugin.
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/bd/Application_Terminal.jpg\"]
LICENSE  = GPL v2 Open Source
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna

SRC_GIT = git://github.com/wosigh/terminal.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
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

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}g++ \
	  clean all \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/lib
	install -m 755 build/src/src/termplugin.so build/$*/usr/palm/applications/${APP_ID}/lib/
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
