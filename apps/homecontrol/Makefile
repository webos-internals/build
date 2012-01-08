NAME     = homecontrol
TITLE    = Home Control
MAINTAINER = sconix
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.8.3
TYPE	 = Application
CATEGORY = Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:HomeControl
ICON	 = http://www.webos-internals.org/images/8/82/Icon_Home-Control.png
DESCRIPTION = Home Control is an universal remote control application. Currently it supports controlling of many media applications running on a computer and few media center boxes. Support for UPNP devices and many other applications/devices will come in later versions. For current list of features see the wiki page for which you can see the link below.<br><br>NOTE: Some features needs a server application as well which you can install with node package manager (npm install hc-server). See the official forum thread and wiki for more information.
MINWEBOSVERSION = 2.1.0
MAXWEBOSVERSION = 3.9.9
CHANGELOG = \
0.8.3: Small bug fix and changes for TouchPad user interface.<br>\
0.8.2: Fixed the startup server discovery spinner.<br>\
0.8.1: Fixed small bug in manual adding of servers.<br>\
0.8.0: First public release.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/f/fa/Home_control.png\" ]

LICENSE  = BSD Open Source License

SRC_GIT = git://github.com/${MAINTAINER}/${NAME}.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src/*.script
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/all.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	find ./build/src -name org.e.lnx.wee* >build/list-mv
	while read file ; do \
		new=`echo $$file | sed s/"org.e.lnx.wee"/"org.webosinternals"/` ; \
		mv $$file $$new ; \
	done < build/list-mv
	grep -r "org.e.lnx.wee" build/src/* | grep -v "^Binary" | cut -d ':' -f 1 | sort | uniq >build/list-sed
	while read file ; do \
		sed -i s/"org.e.lnx.wee"/"org.webosinternals"/ $$file ; \
	done < build/list-sed
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/enyo-app/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
	touch $@

clobber::
	rm -rf build
