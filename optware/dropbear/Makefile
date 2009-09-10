NAME     = dropbear
TITLE	 = Dropbear SSH
APP_ID   = org.webosinternals.${NAME}
VERSION  = 0.52-6
HOMEPAGE = http://matt.ucc.asn.au/${NAME}/
TYPE	 = Optware
CHANGELOG = ${VERSION}: Initial version - binaries only, no configuration yet.
CATEGORY = System Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png

# SRC_OPTWARE = ${NAME}_${VERSION}
SRC_OPTWARE = ${NAME}_0.52-5

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
