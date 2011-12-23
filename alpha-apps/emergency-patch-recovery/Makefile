TYPE = Linux Application
NAME = emergency-patch-recovery
VERSION = 2.1.5
TITLE = Emergency Patch Recovery
MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
DESCRIPTION = --UNINSTALL THEMES FIRST--  Perform 'EPR' on your Pre to restore all backed up files from any patch ipk installations.  Installing this just runs a script to do the patch removals and then removes itself.  WARNING: This is OTA update compatible, but you should run this directly before or directly after you update.  Never run this while a theme is installed.
CHANGELOG = 2.1.5: Added removal of tweaks json files. <br>2.1.4: Added support for aupt-5 and fixed small bug. <br>2.1.1: Modified to use new file_list for aupt-3. <br>2.1.0: Modified to work with aupt, fixed minor bugs. <br>1.1.7: Add cryptofs check before removal <br>1.1.5: Fixed removal of created files.
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
HOMEPAGE = http://www.webos-internals.org/wiki/Portal:Patches_to_webOS
MAINTAINER = WebOS Internals <support@webos-internals.org>
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png
POSTINSTALLFLAGS = RestartDevice

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk
include ../../support/download.mk


.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build
	touch $@

build/all/CONTROL/postinst: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp postinst build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
