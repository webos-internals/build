TYPE = Linux Application
NAME = emergency-migration-helper
VERSION = 1.3.5
TITLE = Emergency Migration Helper
MAINTAINER = WebOS Internals <support@webos-internals.org>
DESCRIPTION = Install this package on your Pre to help webOS 1.3.5 migrate all your homebrew packages from /var to /media/cryptofs/apps.  If you are having problems install applications from the Palm App Catalog, and you have previously installed homebrew services, plugins, patches or themes, then you should install this package.  Installing this package just runs a script to do the migration fixes and then removes itself.  You should only need to run it once, then the device will restart the user interface and the app migration will then proceed in the background, so give it 30 minutes before you try the app catalog again.
APP_ID = org.webosinternals.${NAME}
MAINTAINER = WebOS Internals
CATEGORY = Utilities
ICON = http://www.webos-internals.org/images/4/4f/Epr.png
POSTINSTALLFLAGS=RestartLuna

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

build/all/CONTROL/postinst: build/.unpacked
	mkdir -p build/all/CONTROL
	cp postinst build/all/CONTROL/postinst
	chmod ugo+x $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/.unpacked
	rm -rf build/all
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
