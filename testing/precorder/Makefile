NAME     = precorder
TITLE    = Precorder
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.5.0
TYPE	 = Application
CATEGORY = Media
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Precorder
ICON	 = http://www.webos-internals.org/images/5/58/Icon_WebOSInternals_PrecorderNew.png 
DESCRIPTION = Precorder does things.
CHANGELOG = \
0.5.0: Should function. Pre-Alpha testing purposes only.
SCREENSHOTS = [\
\"\", \
\"\", \
\"\" \
 ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/applications/precorder.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk

include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked

build/.unpacked: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built build/armv6.built
	touch $@

build/armv7.built: build/.unpacked
	rm -rf build/armv7
	mkdir -p build/armv7/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/armv7/usr/palm/applications/${APP_ID}/
	rm -rf build/armv7/usr/palm/applications/${APP_ID}/src
	mkdir -p build/armv7/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/binaries/${NAME} build/armv7/usr/palm/applications/${APP_ID}/bin/${APP_ID}
	touch $@

build/armv6.built: build/.unpacked
	rm -rf build/armv6
	mkdir -p build/armv6/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/armv6/usr/palm/applications/${APP_ID}/
	rm -rf build/armv6/usr/palm/applications/${APP_ID}/src
	mkdir -p build/armv6/usr/palm/applications/${APP_ID}/bin
	install -m 755 build/src/binaries/${NAME} build/armv6/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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
