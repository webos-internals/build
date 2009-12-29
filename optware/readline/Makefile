NAME     = readline
TITLE	 = GNU Readline Library
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 6.0-1
VERSION  = 6.0-1
HOMEPAGE = http://directory.fsf.org/project/readline/
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/f/f3/Icon_WebOSInternals_GNUReadlineLib.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/opt/share build/$*/opt/include
	touch $@
