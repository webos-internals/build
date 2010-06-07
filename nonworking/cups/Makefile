NAME     = cups
TITLE	 = Common Unix Prining System
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 1.4.3-1
VERSION  = 1.4.3
HOMEPAGE = http://www.webos-internals.org/wiki/Application:CUPS
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
DEPENDS  = mobi.optware.openssl mobi.optware.zlip

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc
	touch $@
