NAME     = enyo
TITLE	 = Enyo 1.0
APP_ID   = org.webosinternals.enyo
BLDFLAGS = -p
VERSION  = 1.0.0
TYPE	 = Linux Application
CATEGORY = Frameworks
HOMEPAGE = http://enyojs.org
ICON	 = http://www.webos-internals.org/images/0/06/Enyo.png
DESCRIPTION = Enyo 1.0 (for installation on legacy devices). Note that this package will not overwrite an existing Enyo installation on your device. See https://github.com/enyojs/enyo-1.0/ for more information.
CHANGELOG = 1.0.0: Open Source Enyo 1.0 Release
LICENSE  = Apache 2.0 Open Source

SRC_GIT = git://github.com/enyojs/enyo-1.0.git
GIT_TAG = r1

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -zxf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/framework
	( cd build/src ; tar cf - framework ) | ( cd build/$*/usr/palm/applications/${APP_ID} ; tar xvf - )
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
