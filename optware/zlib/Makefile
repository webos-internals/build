NAME     = zlib
TITLE	 = zlib
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 1.2.3-3
HOMEPAGE = http://www.zlib.net/
DESCRIPTION = A Massively Spiffy Yet Delicately Unobtrusive Compression Library (Also Free, Not to Mention Unencumbered by Patents)
TYPE	 = Optware
CATEGORY = Libraries
ICON	 = http://www.webos-internals.org/images/d/d9/Icon_WebOSInternals_ZLib.png

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
