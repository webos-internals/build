NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = No Auto-Off While Charging
DESCRIPTION = **OBSOLETE** This package supercedes Screen Lock: No Auto-Off While Charging. Please install that package instead. Prevents the screen from turning off while the device is charging.
CATEGORY = Obsolete
VERSION = 1.3.5-99
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
APP_ID=org.webosinternals.patches.${NAME}
TYPE = Patch

package: ipkgs/${APP_ID}_${VERSION}_all.ipk

include ../../support/package.mk
DEPENDS := ${DEPENDS}, org.webosinternals.patches.screen-lock-no-auto-off-while-charging
include ../../support/download.mk

build: build/.built-${VERSION}

build/.built-${VERSION}:
	rm -rf build/all
	mkdir -p build/all
	touch $@

clobber::
	rm -rf build

