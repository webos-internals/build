NAME     = irssi
TITLE	 = Irssi IRC Client
APP_ID   = mobi.optware.${NAME}
VERSION  = 0.8.14-1
HOMEPAGE = http://www.irssi.org/
TYPE	 = Optware
CHANGELOG = ${VERSION}: Initial version - binaries only, no configuration yet.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png

SRC_OPTWARE = ${NAME}_${VERSION}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
