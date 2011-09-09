NAME     = navit-maps
TITLE    = Navit Maps
APP_ID   = org.webosinternals.${NAME}
SIGNER   = org.webosinternals
BLDFLAGS = -p
VERSION	 = 0.0.4-1
TYPE     = Application
CATEGORY = Utilities
DESCRIPTION = <p>This application will manage and download maps from OpenStreetMap for Navit.</p>
CHANGELOG = \
	    0.0.4-1: Use dynamic map-definitions from maps.navit-project.org instead of the old hard-coded ones. <br/> \
	    0.0.3-2: Fix viewport on Pre3 (aka make the black bar at the bottom disappear). <br/> \
	    0.0.2-3: More improvements in calling Navit. <br/> \
	    0.0.2-2: More goodies when calling Navit. <br/> \
	    0.0.2-1: We are getting more confident about this application :). New feature: Just-Type support and Navit can now be used as the default application for routing. <br/> \
	    0.0.1-2: First release. Consider this to be alpha quality software. It may eat your data etc., so do not use it if you rely on a working Navit.
#SCREENSHOTS = [\"http://www.webos-internals.org/images/c/c7/NavitScreenshot2.jpg\",\
#\"http://www.webos-internals.org/images/1/1e/NavitScreenshot1.jpg\",\
#\"http://www.webos-internals.org/images/5/58/NavitScreenshot3.jpg\"]
DEPENDS  = ca.canucksoftware.filemgr
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Navit
ICON	 = http://www.webos-internals.org/images/4/4d/Navit_icon.png
LICENSE  = GPL
MINWEBOSVERSION = 1.4.5

D = build/$*/usr/palm/applications/${APP_ID}

SRC_GIT = git://git.webos-internals.org/applications/navit.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	>$@

.PHONY: build
build: build/.built-${VERSION}
build/.built-${VERSION}: build/all.built-${VERSION}
	>$@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p ${D}
	cp -r build/src/all/* ${D}
	>$@

build/%/CONTROL/postinst:
	rm -f $@
	mkdir -p build/$*/CONTROL
	install -m 0775 build/src/control/postinst build/$*/CONTROL
	chmod ugo+x $@

clobber::
	rm -rf build ../../downloads/navit-hybrid-hybrid.tar.gz
