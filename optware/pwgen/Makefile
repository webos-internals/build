NAME     = pwgen
TITLE	 = Password Generator
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 2.04-1
HOMEPAGE = http://pwgen.sourceforge.net/
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/c/c9/Icon_WebOSInternals_Password.png

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
