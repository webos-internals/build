NAME     = readline
TITLE	 = GNU Readline Library
APP_ID   = mobi.optware.${NAME}
VERSION  = 6.0-1
HOMEPAGE = http://directory.fsf.org/project/readline/
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built : build/%.unpacked
	rm -rf build/$*/opt/share build/$*/opt/include
	touch $@
