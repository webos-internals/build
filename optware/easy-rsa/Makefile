NAME     = easy-rsa
TITLE	 = easy-rsa
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
VERSION  = 2.0-1
HOMEPAGE = http://www.bisente.com/proyectos/easy-rsa-subjectaltname/
DESCRIPTION = This is a small RSA key management package, based on the openssl command line tool.  The files can be found in /opt/share/easy-rsa, and the instructions for use can be found at http://openvpn.net/easyrsa.html
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/5/5f/Icon_WebOSInternals_Base_Optware.png
DEPENDS  = mobi.optware.openssl

SRC_OPTWARE = ${NAME}_2.0rc1SAN-1

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk
