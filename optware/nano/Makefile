NAME     = nano
TITLE	 = Nano
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 2.2.6-1
VERSION  = 2.2.6-1
CHANGELOG = 2.2.6-1: Update Nano.
HOMEPAGE = http://www.nano-editor.org/
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/c/c0/Icon_WebOSInternals_Nano.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
