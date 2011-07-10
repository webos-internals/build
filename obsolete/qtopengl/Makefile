NAME     = qtopengl
TITLE    = Qt OpenGL Demo
APP_ID   = net.griffin.${NAME}
MAXWEBOSVERSION = 1.4.5
VERSION  = 4.6.2
DEPENDS  = net.griffin.qt
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Qt
MAINTAINER = Griffin INet Inc. <darron@griffin.net>
DESCRIPTION = OpenGL ES2 demo for the Qt framework
CHANGELOG = 4.6.2: Initial release
TYPE	 = Application
CATEGORY = Demos
ICON	 = http://www.webos-internals.org/images/2/2e/Net.griffin.qt.png
LICENSE  = LGPL 2.1
SCREENSHOTS = [\
 ]

SRC_GIT = git://git.webos-internals.org/qt/qtopengl.git

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
	install -m 755 build/binaries/$*/* build/$*/usr/palm/applications/${APP_ID}
	install -m 755 build/src/start.sh build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
