NAME     = impostah
TITLE    = Impostah
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.2.0
TYPE	 = Application
CATEGORY = System Utilities
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Impostah
ICON	 = http://www.webos-internals.org/images/a/aa/Tux_Imposter.png
DESCRIPTION = Impostah impersonates service calls.
MINWEBOSVERSION = 2.0.0
CHANGELOG = \
0.2.0: Revamped the database exploration backend.<br>\
0.1.1: Strip comments from JSON files before parsing.<br>\
0.1.0: Revamped the database exploration scene.<br>\
0.0.8: Added support for multiple database locations.<br>\
0.0.7: Set appropriate defaults for all selections.<br>\
0.0.6: Added support for activity configurations.<br>\
0.0.5: Added support for backup configurations.<br>\
0.0.4: Added support for temporary databases.<br>\
0.0.3: Added upstart script.<br>\
0.0.2: Lists DB kinds.<br>\
0.0.1: Initial skeleton.

SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b6/Impostah_ss1.png\", \
\"http://www.webos-internals.org/images/a/a3/Impostah_ss2.png\", \
\"http://www.webos-internals.org/images/6/6d/Impostah_ss3.png\", \
\"http://www.webos-internals.org/images/9/99/Impostah_ss4.png\" \
 ]
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
