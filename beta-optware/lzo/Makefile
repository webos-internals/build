NAME     = lzo
TITLE	 = lzo
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 2.03-1
VERSION  = 2.03-1
HOMEPAGE = http://www.oberhumer.com/opensource/lzo/
DESCRIPTION = LZO is a data compression library which is suitable for real-time operations (it favours speed over compression ratio).
CHANGELOG = 2.03-1: Updated to match ipkg feeds
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/d/d9/Icon_WebOSInternals_ZLib.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/include
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/*.a
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/*.la
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/liblzo.so
	rm -f build/$*/usr/palm/applications/${APP_ID}/opt/lib/liblzo.so.1
	touch $@
