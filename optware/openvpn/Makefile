NAME     = openvpn
TITLE	 = OpenVPN
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 2.1.1-1
VERSION  = 2.1.1-2
HOMEPAGE = http://www.openvpn.net/
DESCRIPTION = OpenVPN is a full-featured open source SSL VPN solution.
TYPE	 = Optware
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/3/3d/Icon_OpenVPN.png
DEPENDS	 = mobi.optware.openssl, mobi.optware.lzo

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked
	rm -rf build/$*/opt/man build/$*/opt/etc  build/$*/opt/var
#	mkdir -p build/$*/opt/etc/${NAME}
#	install -m 644 files/${NAME}.conf build/$*/opt/etc/${NAME}/${NAME}.conf
#	mkdir -p build/$*/etc/event.d
#	install -m 644 upstart/${APP_ID} build/$*/etc/event.d/${APP_ID}
	touch $@
