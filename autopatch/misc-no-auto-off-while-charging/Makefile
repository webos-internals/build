NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = No Auto-Off While Charging
DESCRIPTION = **OBSOLETE** This package is superceded by Screen Lock: No Auto-Off While Charging. Please install that package instead. Prevents the screen from turning off while the device is charging.
CATEGORY = Obsolete
VERSIONS = 1.3.1-99 1.3.5-99
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
APP_ID=org.webosinternals.patches.${NAME}
TYPE = Patch
META_SUB_VERSION=2

include ../common.mk
include ../../support/download.mk

DEPENDS = org.webosinternals.patches.screen-lock-no-auto-off-while-charging

build/.built-${VERSION}:
	touch $@

build/.unpacked-${VERSION}:
	rm -rf build/all
	mkdir -p build/all
	touch $@
