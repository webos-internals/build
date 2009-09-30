TYPE = System Utilities
NAME = emergency-patch-recovery
VERSION = 1.1.0-2
TITLE = Emergency Patch Recovery 1.1.0
DESCRIPTION = Perform EPR on your Pre to restore all backed up files from any patch ipk installations.  WebOS 1.1.0 only!
APP_ID = org.webosinternals.${NAME}
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
CATEGORY = System Utilities
VERSION = 0.1.16
DEPENDS = org.webosinternals.patch org.webosinternals.diffstat
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk


.PHONY: unpack
unpack: build/.unpacked

build/.unpacked:
	rm -rf build
	mkdir -p build
	touch $@

#build/all/CONTROL/prerm: build/.unpacked
	#mkdir -p build/all/CONTROL
	#cp ../prerm build/all/CONTROL/prerm
	#sed -i -e s/PATCH_NAME=/PATCH_NAME=${NAME}.patch/ build/all/CONTROL/prerm
	#sed -i -e s/APP_DIR=/APP_DIR=\\/var\\/usr\\/palm\\/applications\\/org.webosinternals.${NAME}/ build/all/CONTROL/prerm
	#chmod ugo+x $@

build/all/CONTROL/postinst: build/.unpacked
	mkdir -p build/all/CONTROL
	cp postinst build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: build
build: build/.built

build/.built: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
