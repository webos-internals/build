NAME = vkb-default-themes-config
APP_ID = org.webosinternals.${NAME}
VERSION = 1.0.1
TITLE = VKB Default Themes and Configuration
TYPE = Miscellaneous
CATEGORY = Virtual Keyboard
ICON = http://www.webos-internals.org/images/0/0f/Icon_WebOSInternals_Keyboard.png
DESCRIPTION = This package contains the default themes and configuration file for the Virtual Keyboard patch.
MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
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
