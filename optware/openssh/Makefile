NAME     = openssh
TITLE	 = OpenSSH
APP_ID   = org.webosinternals.${NAME}
VERSION  = 5.2.1-2
HOMEPAGE = http://www.openssh.com/
TYPE	 = Optware
CHANGELOG = ${VERSION}: Initial version - binaries only, no configuration yet.
CATEGORY = System Utilities
ICON	 = http://www.webos-internals.org/images/8/86/Icon_WebOSInternals_OpenSSH.png

SRC_OPTWARE = ${NAME}_5.2p1-2

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
