NAME     = openssh-sftp-server
TITLE	 = OpenSSH SFTP Server
APP_ID   = mobi.optware.${NAME}
VERSION  = 5.3.1-2
HOMEPAGE = http://www.webos-internals.org/wiki/Application:OpenSSH
TYPE	 = Optware
DESCRIPTION = OpenSSH SFTP Server is a full-featured SFTP server, which enables secure root file transfer via wifi only, on port 22, with secure ssh key authentication only (passwords are completely disabled by default).  See the Homepage link for mandatory configuration instructions.
CHANGELOG = 5.3.1-2: Updated for the transition to webOS 1.3.5, safe to install on 1.3.1 or later.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/86/Icon_WebOSInternals_OpenSSH.png
DEPENDS	 = mobi.optware.openssh

SRC_OPTWARE = ${NAME}_5.3p1-1

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
