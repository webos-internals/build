NAME     = impostah
TITLE    = Impostah
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.3.8
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Impostah
ICON	 = http://www.webos-internals.org/images/a/aa/Tux_Imposter.png
DESCRIPTION = Impostah impersonates service calls.
MINWEBOSVERSION = 2.0.0
CHANGELOG = \
0.3.8: Added support for app databases.<br>\
0.3.7: Added support for app cookies.<br>\
0.3.6: Added support for web cookies.<br>\
0.3.5: Do not capitalise JSON field names.<br>\
0.3.4: Added structured display of JSON data.<br>\
0.3.3: Added support for app catalog exploration.<br>\
0.3.2: Added support for reporting the telephony platform.<br>\
0.3.1: Added support for reporting the device profile.<br>\
0.3.0: Added support for connection exploration.<br>\
0.2.9: Dual column main scene.<br>\
0.2.8: Added support for permission exploration.<br>\
0.2.7: Added support for application exploration.<br>\
0.2.6: Added support for account exploration.<br>\
0.2.5: Fixed a bug in the query list.<br>\
0.2.4: Added a query and item display scenes.<br>\
0.2.3: Added a better list selector.<br>\
0.2.2: Added support for keystore exploration.<br>\
0.2.1: Revamped the activity exploration backend.<br>\
0.2.0: Revamped the database exploration backend.<br>\
0.1.1: Strip comments from JSON files before parsing.<br>\
0.1.0: Revamped the database exploration scene.<br>\
0.0.8: Added support for multiple database locations.<br>\
0.0.7: Set appropriate defaults for all selections.<br>\
0.0.6: Added support for activity exploration.<br>\
0.0.5: Added support for backup exploration.<br>\
0.0.4: Added support for temporary databases.<br>\
0.0.3: Added upstart script.<br>\
0.0.2: Lists DB kinds.<br>\
0.0.1: Initial skeleton.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b6/Impostah_ss1.png\", \
\"http://www.webos-internals.org/images/a/a3/Impostah_ss2.png\", \
\"http://www.webos-internals.org/images/6/6d/Impostah_ss3.png\", \
\"http://www.webos-internals.org/images/9/99/Impostah_ss4.png\", \
\"http://www.webos-internals.org/images/d/d8/Impostah_ss5.png\", \
\"http://www.webos-internals.org/images/f/f4/Impostah_ss6.png\" ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/impostah.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/arm.built-${VERSION} build/i686.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src/src ; \
	  ${MAKE} STAGING_DIR=${STAGING_DIR_$*} CC=${CROSS_COMPILE_$*}gcc \
	  clobber ${NAME} \
	)
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/src/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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
