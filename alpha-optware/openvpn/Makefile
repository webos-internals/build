NAME     = openvpn
TITLE	 = OpenVPN
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 2.2.0-1
VERSION  = 2.2.0-2
HOMEPAGE = http://www.openvpn.net/
DESCRIPTION = OpenVPN is a full-featured open source SSL VPN solution.  You must supply a valid /opt/etc/openvpn/openvpn.conf configuration file.
CHANGELOG = \
2.2.0-2: Robustified upstart scripts to improve start-up reliability.<br>\
2.2.0-1: Updated to latest OpenVPN upstream version.<br>\
2.1.1-5: Fixed the upstart script.<br>\
2.1.1-4: Moved upstart script from /etc/event.d/ to /var/palm/event.d/ to handle apps and data erases better.<br>\
2.1.1-3: Made compatible with the Emergency Service Enabler to survive doctoring.
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

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/man
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/var
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/
	touch $@
