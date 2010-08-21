NAME	= navit
TITLE	= Navit - Car navigation system
APP_ID	= org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION	= 0.2.0.3490-4
TYPE    =  Application
CATEGORY = Utilities
DESCRIPTION = <strong style="color:red">THIS ONLY WORKS with webOS >=1.4.5</strong><br />Navit is an open source (GPL) car navigation software for Linux systems. It will display your position on a map (in bird-view mode or as a 3D "visualization") from GPS sensor data, and can provide precise route calculation, touch screen functionality and supports Points of Interest (POI), which can be extended via an easy to use plugin system. Unlike other navigation systems, Navit maps are dynamically generated in real time  from vector data.
CHANGELOG = \
	0.2.0.3490-4: Make sure the maps-directory exists <br/> \
	0.2.0.3490-3: Fixed wrong default speech engine <br/> \
	0.2.0.3490-2: Initial release
DEPENDS  = org.webosinternals.locale, org.webosinternals.speechd
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Navit
ICON	 = http://www.webos-internals.org/images/4/4d/Navit_icon.png
LICENSE  = GPL
MINWEBOSVERSION = 1.4.5
DEVICECOMPATIBILITY = [\"Pre\"]

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/applications/navit.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

.PHONY: build
build: build/.built-${VERSION}
build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p ${D}
	cp -r build/src/* ${D}
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
