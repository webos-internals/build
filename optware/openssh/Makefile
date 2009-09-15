NAME     = openssh
TITLE	 = OpenSSH
APP_ID   = org.webosinternals.${NAME}
VERSION  = 5.2.1-5
HOMEPAGE = http://www.webos-internals.org/wiki/Application:OpenSSH
TYPE	 = Optware
CHANGELOG = 5.2.1-5: Access available via wifi only, on port 22, with key authentication only.
CATEGORY = System Utilities
ICON	 = http://www.webos-internals.org/images/8/86/Icon_WebOSInternals_OpenSSH.png
DEPENDS  = org.webosinternals.openssl, org.webosinternals.zlib

SRC_OPTWARE = ${NAME}_5.2p1-2

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk ipkgs/${APP_ID}_${VERSION}_i686.ipk
include ../../support/package.mk

include ../../support/download.mk

build/armv7.built : build/armv7.unpacked
	rm -rf build/armv7/opt/etc/default build/armv7/opt/etc/init.d
	mkdir -p build/armv7/etc/event.d
	install -m 644 upstart/${APP_ID} build/armv7/etc/event.d/${APP_ID}
	touch $@

build/i686.built : build/i686.unpacked
	rm -rf build/i686/opt/etc/default build/i686/opt/etc/init.d
# The emulator already has an ssh server running, so no need to start another.
	touch $@

include ../../support/optware.mk
