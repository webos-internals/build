NAME     = openssh
TITLE	 = OpenSSH
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 5.9p1-1
VERSION  = 5.9.1-1
HOMEPAGE = http://www.webos-internals.org/wiki/Application:OpenSSH
TYPE	 = Optware
DESCRIPTION = OpenSSH is a full-featured SSH server and client, which enables secure root access via wifi only, on port 22, with secure ssh key authentication only (passwords are completely disabled by default).  See the Homepage link for mandatory configuration instructions.
CHANGELOG = \
5.9.1-1: Updated to match recent versions <br>\
5.3.1-9: Only make the rootfs writeable when absolutely necessary.<br>\
5.3.1-8: Moved upstart script from /etc/event.d/ to /var/palm/event.d/ to handle apps and data erases better.<br>\
5.3.1-5: Made compatible with the Emergency Service Enabler to survive doctoring.<br>\
5.3.1-3: Added default profile to set up ssh-agent.<br>5.3.1-2: Updated for future webOS compatibility.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/86/Icon_WebOSInternals_OpenSSH.png
DEPENDS  = mobi.optware.openssl, mobi.optware.zlib, mobi.optware.ipkg-opt

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/optware.mk

build/%.built-${VERSION} : build/%.unpacked-${VERSION}
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc/default
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/etc/init.d
	rm -rf build/$*/usr/palm/applications/${APP_ID}/opt/bin/slogin
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/upstart
	install -m 644 upstart/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/upstart/
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/profile
	install -m 644 profile/${APP_ID} build/$*/usr/palm/applications/${APP_ID}/profile/
	touch $@
