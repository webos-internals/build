NAME     = openssl
TITLE	 = OpenSSL
APP_ID   = mobi.optware.${NAME}
VERSION  = 0.9.8k-1
HOMEPAGE = http://www.openssl.org/
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png

SRC_OPTWARE = ${NAME}_0.9.8k-1

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
