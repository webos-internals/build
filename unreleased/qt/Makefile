NAME     = qt
TITLE    = Qt Framework
APP_ID   = net.griffin.${NAME}
VERSION  = 4.6.2
HOMEPAGE = 
MAINTAINER = 
DESCRIPTION = 
CHANGELOG = 
TYPE	 = Linux Application
CATEGORY = Infrastructure
ICON	 = 
LICENSE  = 
SCREENSHOTS = [\
 ]

SRC_GIT = git://git.webos-internals.org/qt/qt.git

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
