NAME     = zcorder
TITLE    = zcorder
APP_ID   = org.webosinternals.${NAME}
MAXWEBOSVERSION = 1.9.9
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION  = 0.6.0
TYPE	 = Application
CATEGORY = Media
HOMEPAGE = http://www.webos-internals.org/wiki/Application:zcorder
ICON	 = http://www.webos-internals.org/images/f/fd/Icon_WebOSInternals_zcorder.png 
DESCRIPTION = zcorder records audio from the microphone, and can also cut ringtones from an internal stream, both in mp3.
CHANGELOG = 0.6.0: initial public beta release.<br>
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/3/3d/Zcorder_1.png\", \
\"http://www.webos-internals.org/images/8/81/Zcorder_2.png\", \
\"http://www.webos-internals.org/images/c/c6/Zcorder_3.png\" \
 ]
LICENSE  = GPL v2 Open Source

SRC_GIT = git://github.com/webos-internals/zcorder.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk

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

build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	mkdir -p build/$*/usr/palm/applications/${APP_ID}
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	rm -rf build/$*/usr/palm/applications/${APP_ID}/src
	install -m 755 build/src/bin/${NAME} build/$*/usr/palm/applications/${APP_ID}/bin/${APP_ID}
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
