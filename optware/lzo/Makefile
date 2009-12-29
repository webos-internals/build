NAME     = lzo
TITLE	 = lzo
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VERS = 1.08-2
VERSION  = ${OPT_VERS}.1
HOMEPAGE = http://www.oberhumer.com/opensource/lzo/
DESCRIPTION = LZO is a data compression library which is suitable for real-time operations (it favours speed over compression ratio).
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/d/d9/Icon_WebOSInternals_ZLib.png

SRC_OPTWARE = ${NAME}_${OPT_VERS}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/opt/include build/$*/opt/lib/*.a build/$*/opt/lib/*.la
	touch $@
