NAME     = zlib
TITLE	 = zlib
APP_ID   = org.webosinternals.${NAME}
VERSION  = 1.2.3-3
HOMEPAGE = http://www.zlib.net/
TYPE	 = Optware
CHANGELOG = ${VERSION}: Initial version - binaries only, no configuration yet.
CATEGORY = System Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
