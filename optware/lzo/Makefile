NAME     = lzo
TITLE	 = lzo
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 1.08-2
HOMEPAGE = http://www.oberhumer.com/opensource/lzo/
DESCRIPTION = LZO is a data compression library which is suitable for real-time operations (it favours speed over compression ratio).
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/d/d9/Icon_WebOSInternals_ZLib.png

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/opt/include
	touch $@
