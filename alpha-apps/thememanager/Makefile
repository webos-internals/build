NAME     = thememanager
TITLE    = Theme Manager
APP_ID   = org.webosinternals.${NAME}
SRV_ID   = org.webosinternals.${NAME}.srv
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.2.0
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/webos-internals/303050-theme-manager.html#post3201074
ICON	 = http://www.webos-internals.org/images/9/9d/Icon_Theme-Manager.png
DESCRIPTION = Theme Manager for you device.
MINWEBOSVERSION = 2.1.0
CHANGELOG = \
0.2.0: Added support for phones with enyo.<br>\
0.1.2: Initial alpha release.

DEPENDS = org.webosinternals.patch, org.webosinternals.lsdiff, org.webosinternals.unzip

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b9/Theme_manager.png\" ]

LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/theme-manager.git

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
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/enyo-app/* build/$*/usr/palm/applications/${APP_ID}/
	mkdir -p build/$*/usr/palm/services/${SRV_ID}
	cp -r build/src/node-service/* build/$*/usr/palm/services/${SRV_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/node-service
	mkdir -p build/$*/usr/palm/packages/${APP_ID}
	cp -r build/src/package/* build/$*/usr/palm/packages/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/package
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
