NAME = vkb-theme-remix-classic
APP_ID = org.webosinternals.themes.${NAME}
VERSION = 1.1.1
TITLE = Remix Classic
TYPE = Theme
CATEGORY = Virtual Keyboard
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = This package contains the remix classic theme for the Virtual Keyboard patch.
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/b9/RemixClassic.png\"]
HOMEPAGE = http://www.webos-internals.org/wiki/Virtual_Keyboard_Configuration
MAXWEBOSVERSION = 1.9.9

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
