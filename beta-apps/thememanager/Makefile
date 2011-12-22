NAME     = thememanager
TITLE    = Theme Manager
APP_ID   = org.webosinternals.${NAME}
SRV_ID   = org.webosinternals.${NAME}.srv
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.9.2
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://forums.precentral.net/webos-internals/303050-theme-manager.html#post3201074
ICON	 = http://www.webos-internals.org/images/9/9d/Icon_Theme-Manager.png
DESCRIPTION = Theme Manager for you device.
MINWEBOSVERSION = 2.1.0
MAXWEBOSVERSION = 3.9.9
CHANGELOG = \
0.9.2: Added skipping of invalid theme directories.<br>\
0.9.1: Allowed patching of index.html files.<br>\
0.9.0: Fixed a bug in theme scan that caused weird problems.<br>\
0.8.9: Small update for the theme installation scripts.<br>\
0.8.5: Small fixes/cleanups and support for themes installed by ipk.<br>\
0.8.1: Fixed patching/replacing of files located in cryptofs.<br>\
0.8.0: Added searching/filtering of themes and made UI smoother.<br>\
0.7.0: Logic changes and added list view mode for theme library.<br>\
0.6.9: Fixed third party applications theming which was broken.<br>\
0.6.8: Couple small bug fixes for user interface and for the service.<br>\
0.6.7: Fixed a bug in theme applying that could have caused problems.<br>\
0.6.6: Fixed serious bug that caused theme applying time get long.<br>\
0.6.5: More user interfaces fixes and polishing for phones.<br>\
0.6.0: Couple small bug fixes and fine tuned the user interface.<br>\
0.5.5: Small fixes and added support for Boot Logo component.<br>\
0.5.4: Interface fine tuning for both phones and TouchPad.<br>\
0.5.3: Few interface fixes when running on TouchPad.<br>\
0.5.2: Few interface fixes and theme installation fix.<br>\
0.5.1: Couple small bug and typo fixes.<br>\
0.5.0: First beta release with many changes.<br>\
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
