NAME     = openssh
TITLE	 = OpenSSH
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 5.3p1-1
VERSION  = 5.3.1-4
HOMEPAGE = http://www.webos-internals.org/wiki/Application:OpenSSH
TYPE	 = Optware
DESCRIPTION = OpenSSH is a full-featured SSH server and client, which enables secure root access via wifi only, on port 22, with secure ssh key authentication only (passwords are completely disabled by default).  See the Homepage link for mandatory configuration instructions.
CHANGELOG = 5.3.1-4: Made compatible with the Emergency Service Enabler to survive doctoring.
CHANGELOG += <br>5.3.1-3: Added default profile to set up ssh-agent.<br>5.3.1-2: Updated for future webOS compatibility.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/8/86/Icon_WebOSInternals_OpenSSH.png
DEPENDS  = mobi.optware.openssl, mobi.optware.zlib, mobi.optware.ipkg-opt

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

build/armv7.built-${VERSION} : build/armv7.unpacked
	rm -rf build/armv7/usr/palm/applications/${APP_ID}/opt/etc/default
	rm -rf build/armv7/usr/palm/applications/${APP_ID}/opt/etc/init.d
	rm -rf build/armv7/usr/palm/applications/${APP_ID}/opt/bin/slogin
	mkdir -p build/armv7/etc/profile.d
	install -m 644 profile/${APP_ID} build/armv7/etc/profile.d/${APP_ID}
	mkdir -p build/armv7/etc/event.d
	install -m 644 upstart/${APP_ID} build/armv7/etc/event.d/${APP_ID}
	touch $@

build/armv6.built-${VERSION} : build/armv6.unpacked
	rm -rf build/armv6/usr/palm/applications/${APP_ID}/opt/etc/default
	rm -rf build/armv6/usr/palm/applications/${APP_ID}/opt/etc/init.d
	rm -rf build/armv6/usr/palm/applications/${APP_ID}/opt/bin/slogin
	mkdir -p build/armv6/etc/profile.d
	install -m 644 profile/${APP_ID} build/armv6/etc/profile.d/${APP_ID}
	mkdir -p build/armv6/etc/event.d
	install -m 644 upstart/${APP_ID} build/armv6/etc/event.d/${APP_ID}
	touch $@

build/i686.built-${VERSION} : build/i686.unpacked
	rm -rf build/i686/usr/palm/applications/${APP_ID}/opt/etc/default
	rm -rf build/i686/usr/palm/applications/${APP_ID}/opt/etc/init.d
	rm -rf build/i686/usr/palm/applications/${APP_ID}/opt/bin/slogin
	mkdir -p build/armv6/etc/profile.d
	install -m 644 profile/${APP_ID} build/armv6/etc/profile.d/${APP_ID}
# The emulator already has an ssh server running, so no need to start another.
	touch $@

include ../../support/optware.mk
