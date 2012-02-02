NAME     = enyo
TITLE	 = Enyo 1.0
APP_ID   = org.webosinternals.enyo
VERSION  = 1.0.0
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://enyojs.org
ICON	 = http://www.webos-internals.org/images/0/06/Enyo.png
DESCRIPTION = Enyo
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
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	( cd build/src/framework ; tar cf - . ) | ( cd build/$*/usr/palm/applications/${APP_ID} ; tar xvf - )
	#touch $@

build/%/CONTROL/postinst: postinst
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 postinst build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/prerm: prerm
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 prerm build/$*/CONTROL
	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build
