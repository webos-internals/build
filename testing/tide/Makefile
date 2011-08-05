NAME     = tide
TITLE    = TouchPad IDE
APP_ID   = us.ryanhope.${NAME}
SRV_ID   = us.ryanhope.${NAME}.fileio
SIGNER   = org.webosinternals
BLDFLAGS = -p
BASEVER  = 0.0.18-1
GIT_TAG  = v${BASEVER}
VERSION  = ${BASEVER}
TYPE	 = Application
CATEGORY = Development
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Tide
ICON	 = http://www.webos-internals.org/images/0/02/Icon-64.png
DESCRIPTION = A code editor (and soon more) for your TouchPad.
MINWEBOSVERSION = 3.0.0

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/14/Tide_2011-31-07_141616.png\" ]

LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/enyo/editah.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	#cp -r ~/workspace/editah/* build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	#cd build/src; git submodule update --init --recursive
	mkdir build/src/control
	mv build/src/pmPostInstall.script build/src/control/postinst
	mv build/src/pmPreRemove.script build/src/control/prerm
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	cd build/src
	mv build/src/ace-build build/src/ace
	#make clean ace/build/src/ace.js;\
	#rm -rf `cat excludes.txt`;\
	#rm -rf Makefile;\
	#rm -rf `find . -name ".git*"`
	mkdir -p build/$*/usr/palm/services
	cp -r build/src/node-service build/$*/usr/palm/services/${SRV_ID}
	mkdir -p build/$*/usr/palm/packages
	cp -r build/src/package build/$*/usr/palm/packages/${APP_ID}
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/node-service
	rm -rf build/$*/usr/palm/applications/${APP_ID}/package
	rm -rf build/$*/usr/palm/applications/${APP_ID}/control
	touch $@

build/%/CONTROL/prerm:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/prerm build/$*/CONTROL
	chmod ugo+x $@

build/%/CONTROL/postinst:
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
