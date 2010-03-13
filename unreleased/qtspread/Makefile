NAME     = qtspread
TITLE    = Qt Spread
APP_ID   = net.griffin.${NAME}
VERSION  = 4.6.2
DEPENDS  = net.griffin.qt
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Qt
MAINTAINER = Griffin INet, Inc. <darron@griffin.net>
DESCRIPTION = Spreadsheet demo for the Qt framework
CHANGELOG = 4.6.2: Initial release
TYPE	 = Application
CATEGORY = Applications
ICON	 = http://www.webos-internals.org/images/2/2e/Net.griffin.qt.png
LICENSE  = LGPL 2.1
SCREENSHOTS = [\ \"http://www.webos-internals.org/images/1/1e/Net.griffin.qtspread.png\"\
 ]

SRC_GIT = git://git.webos-internals.org/qt/qtspread.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/src/binaries build/binaries
	touch $@

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpack
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/binaries/$*/qt build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
