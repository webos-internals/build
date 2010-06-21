NAME = vkb-theme-eazys-theme2
APP_ID = org.webosinternals.${NAME}
VERSION = 1.0.1
TITLE = Eazys Theme 2
TYPE = Miscellaneous
CATEGORY = VKB Theme
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = This package contains eazys theme 2 for the Virtual Keyboard patch.
SCREENSHOTS = [\"http://www.webos-internals.org/images/8/83/Eazystheme2.jpg\"]
HOMEPAGE = http://www.webos-internals.org/wiki/Virtual_Keyboard_Configuration

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk

include ../../support/package.mk

build/.built-${VERSION}:
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 additional_files.tar.gz build/all/usr/palm/applications/${APP_ID}
	touch $@

clobber::
	rm -rf build
