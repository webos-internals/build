NAME     = dropbear
TITLE	 = Dropbear
APP_ID   = mobi.optware.${NAME}
SIGNER   = mobi.optware
OPT_VER  = 0.52-5
VERSION  = 0.52-9
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Dropbear
TYPE	 = Optware
DESCRIPTION = Dropbear is a compact SSH server and client, which enables secure root access via wifi only, on port 22, with secure ssh key authentication only (passwords are completely disabled by default).  See the Homepage link for mandatory configuration instructions.
CHANGELOG = 0.52-9: Updated for future webOS compatibility.<br>0.52-8: Initial version.
CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/7/76/Icon_WebOSInternals_DropBear.png

SRC_OPTWARE = ${NAME}_${OPT_VER}

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_armv6.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

build/armv7.built-${VERSION} : build/armv7.unpacked
	rm -rf build/armv7/opt/etc/default build/armv7/opt/etc/init.d
	mkdir -p build/armv7/etc/event.d
	install -m 644 upstart/${APP_ID} build/armv7/etc/event.d/${APP_ID}
	touch $@

build/armv6.built-${VERSION} : build/armv6.unpacked
	rm -rf build/armv6/opt/etc/default build/armv6/opt/etc/init.d
	mkdir -p build/armv6/etc/event.d
	install -m 644 upstart/${APP_ID} build/armv6/etc/event.d/${APP_ID}
	touch $@

build/i686.built-${VERSION} : build/i686.unpacked
	rm -rf build/i686/opt/etc/default build/i686/opt/etc/init.d
# The emulator already has an ssh server running, so no need to start another.
	touch $@

include ../../support/optware.mk
