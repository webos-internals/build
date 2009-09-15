NAME     = bash
TITLE	 = Bourne Again SHell
APP_ID   = mobi.optware.${NAME}
VERSION  = 3.2.49-1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Bash
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
DEPENDS  = mobi.optware.readline

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built : build/%.unpacked
	rm -rf build/$*/opt/etc
	touch $@
