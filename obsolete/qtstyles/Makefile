NAME     = qtstyles
TITLE    = Qt Styles
APP_ID   = net.griffin.${NAME}
MAXWEBOSVERSION = 1.4.5
VERSION  = 4.6.2
DEPENDS  = net.griffin.qt
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Qt
MAINTAINER = Griffin INet Inc. <darron@griffin.net>
DESCRIPTION = Styles demo for the Qt framework
CHANGELOG = 4.6.2: Initial release
TYPE	 = Application
CATEGORY = Demos
ICON	 = http://www.webos-internals.org/images/2/2e/Net.griffin.qt.png
LICENSE  = LGPL 2.1
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/0/07/Net.griffin.qtstyles.png\", \
\"http://www.webos-internals.org/images/3/39/Net.griffin.qtstyles_cde.png\", \
\"http://www.webos-internals.org/images/b/b3/Net.griffin.qtstyles_cleanlooks.png\", \
\"http://www.webos-internals.org/images/5/5b/Net.griffin.qtstyles_plastique.png\", \
\"http://www.webos-internals.org/images/6/6d/Net.griffin.qtstyles_windows.png\"\
 ]

SRC_GIT = git://git.webos-internals.org/qt/qtstyles.git

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
	install -m 755 build/binaries/$*/* build/$*/usr/palm/applications/${APP_ID}/
	install -m 755 build/src/start.sh build/$*/usr/palm/applications/${APP_ID}/
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
