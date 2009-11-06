NAME     = openssh-sftp-server
TITLE	 = OpenSSH SFTP Server
APP_ID   = mobi.optware.${NAME}
VERSION  = 5.3.1-1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:OpenSSH
TYPE	 = Optware
CHANGELOG = 5.3.1-1: Access available via wifi only, on port 22, with key authentication only.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/86/Icon_WebOSInternals_OpenSSH.png
DEPENDS	 = mobi.optware.openssh

SRC_OPTWARE = ${NAME}_5.3p1-1

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
