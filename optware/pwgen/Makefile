NAME     = pwgen
TITLE	 = Password Generator
APP_ID   = org.webosinternals.${NAME}
VERSION  = 2.04-1
HOMEPAGE = http://pwgen.sourceforge.net/
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
