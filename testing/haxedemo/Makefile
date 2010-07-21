NAME     = haxedemo
TITLE    = haXe Demo
APP_ID   = com.eclecticdesignstudio.${NAME}
VERSION  = 0.1
TYPE     = Application
BLDFLAGS = -p
CATEGORY = Demos
MAINTAINER = elyon, zsoc
HOMEPAGE = http://www.webos-internals.org/wiki/Application:haXedemo
ICON     = http://www.webos-internals.org/wiki/Image:Haxedemoicon.png
DESCRIPTION = A fun little physics demo showing off haXe on webOS. Controls: tap, 1-6. <b><font color=red>THIS ONLY WORKS with webOS >=1.4.5</font></b>
CHANGELOG = 0.1: initial demo release.
SCREENSHOTS = 
LICENSE  = GPL v2 Open Source

SRC_GIT = git://git.webos-internals.org/haxe/demo.git
GIT_TAG = v0.1

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_arm.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src/
	tar -C build/src -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	touch $@

build/.built-${VERSION}: build/arm.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

#build/%/CONTROL/postinst:
#	rm -f $@
#	mkdir -p build/$*/CONTROL
#	install -m 0775 build/src/control/postinst build/$*/CONTROL
#	chmod ugo+x $@

#build/%/CONTROL/prerm:
#	rm -f $@
#	mkdir -p build/$*/CONTROL
#	install -m 0775 build/src/control/prerm build/$*/CONTROL
#	chmod ugo+x $@

.PHONY: clobber
clobber::
	rm -rf build

