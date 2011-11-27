NAME     = qt
TITLE    = Qt Framework
APP_ID   = net.griffin.${NAME}
MAXWEBOSVERSION = 1.4.5
VERSION  = 4.6.2
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Qt
MAINTAINER = Griffin INet Inc. <darron@griffin.net>
DESCRIPTION = Qt framework libraries, needed to run Qt applications
CHANGELOG = 4.6.2: Initial release
TYPE	 = Linux Application
CATEGORY = Infrastructure
ICON	 = http://www.webos-internals.org/images/2/2e/Net.griffin.qt.png
LICENSE  = LGPL 2.1
SCREENSHOTS = [\
 ]

SRC_GIT = git://git.webos-internals.org/qt/qt.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/binaries/$*/qt build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
