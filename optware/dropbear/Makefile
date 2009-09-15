NAME     = dropbear
TITLE	 = Dropbear
APP_ID   = mobi.optware.${NAME}
VERSION  = 0.52-8
HOMEPAGE = http://www.webos-internals.org/wiki/Application:Dropbear
TYPE	 = Optware
CHANGELOG = 0.52-8: Access available via wifi only, on port 22, with key authentication only.

CATEGORY = Utilities
ICON	 = http://www.webos-internals.org/images/7/76/Icon_WebOSInternals_DropBear.png

SRC_OPTWARE = ${NAME}_0.52-5

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
