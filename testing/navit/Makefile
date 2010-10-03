NAME	= navit
TITLE	= Navit - Car navigation system
APP_ID	= org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION	= 0.2.0.3591-1
TYPE    =  Application
CATEGORY = Utilities
DESCRIPTION = <p><strong style="color:red">THIS ONLY WORKS with webOS >= 1.4.5 \
       </strong></p><p>This package does not include map-data. Please visit \
       the <a href="http://www.webos-internals.org/wiki/Application:Navit">\
       Homepage</a> to find out how to obtain and install maps.</p><p>Navit is \
       an open source (GPL) car navigation software for Linux systems. It will \
       display your position on a map (in bird-view mode or as a 3D \
       "visualization") from GPS sensor data, and can provide precise route \
       calculation, touch screen functionality and supports Points of Interest \
       (POI), which can be extended via an easy to use plugin system. Unlike \
       other navigation systems, Navit maps are dynamically generated in real \
       time from vector data.</p>
CHANGELOG = \
	    0.2.0.3591-1: update to svn r3591, remove POI patch <br/> \
	    0.2.0.3587-1: update to svn r3587, add POI optimization from ticket 619 <br/> \
	    0.2.0.3582-1: update to svn r3582, gets rid of "Unknown key e17", features new navit_layout.xml from HaPe <br/> \
	    0.2.0.3541-1: update ro svn r3541, now officially containing the sunrise-fix <br/> \
	    0.2.0.3540-1: update ro svn r3540 <br/> \
	    0.2.0.3537-2: Add support for Pixi <br/> \
	    0.2.0.3537-1: update to svn r3537; apply fix for sunrise/set calculation; use a smaller font for the next street name.<br/> \
	    0.2.0.3490-4: Make sure the maps-directory exists <br/> \
	    0.2.0.3490-3: Fixed wrong default speech engine <br/> \
	    0.2.0.3490-2: Initial release
SCREENSHOTS = [\"http://www.webos-internals.org/images/c/c7/NavitScreenshot2.jpg\",\
\"http://www.webos-internals.org/images/1/1e/NavitScreenshot1.jpg\",\
\"http://www.webos-internals.org/images/5/58/NavitScreenshot3.jpg\"]
DEPENDS  = org.webosinternals.locale, org.webosinternals.speechd
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Navit
ICON	 = http://www.webos-internals.org/images/4/4d/Navit_icon.png
LICENSE  = GPL
MINWEBOSVERSION = 1.4.5

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/applications/navit.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk
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
build/.built-${VERSION}: build/armv7.built-${VERSION} build/armv6.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p ${D}
	cp -r build/src/all/* build/src/$*/* ${D}
	touch $@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build
