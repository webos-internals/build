NAME = add-launcher-tabs
TITLE = Add Launcher Tabs
APP_ID = org.webosinternals.${NAME}
SIGNER = org.webosinternals
VERSION = 3.0.0
TYPE = Linux Application
CATEGORY = Utilities
MAINTAINER = WebOS Internals <support@webos-internals.org>
HOMEPAGE = http://www.webos-internals.org/wiki/WebOS3.0_Launcher_Tweaks
ICON = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
DESCRIPTION = Adds GAMES and HOMEBREW tabs to the TouchPad launcher. Note that this package does not appear as an icon in your launcher when it is installed. When you uninstall this package (using Preware), the additional tabs are removed and the applications on those tabs will revert to the Downloads tab.
CHANGELOG = 3.0.0: Initial release.
POSTINSTALLFLAGS = RestartLuna
POSTUPDATEFLAGS  = RestartLuna
POSTREMOVEFLAGS  = RestartLuna
MINWEBOSVERSION = 3.0.0

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

build/all/CONTROL/prerm: build/.unpacked-${VERSION}
	mkdir -p build/all/CONTROL
	cp prerm build/all/CONTROL/prerm
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
