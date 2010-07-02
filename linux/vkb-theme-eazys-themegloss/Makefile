NAME = vkb-theme-eazys-themegloss
APP_ID = org.webosinternals.themes.${NAME}
VERSION = 1.1.1
TITLE = Eazyz Theme Gloss
TYPE = Theme
CATEGORY = Virtual Keyboard
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = This package contains eazys theme gloss for the Virtual Keyboard patch.
SCREENSHOTS = [\"http://www.webos-internals.org/images/f/f8/Eazysthemegloss.jpg\"]
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
