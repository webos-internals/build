NAME     = libstdc++
TITLE	 = libstdc++
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 6.0.9-6
HOMEPAGE = http://www.codesourcery.com/sgpp/lite/arm/portal/release323
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/5/5f/Icon_WebOSInternals_Base_Optware.png

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	touch $@
