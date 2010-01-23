NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = No Auto-Off While Charging
DESCRIPTION = **OBSOLETE** This package is superceded by Screen Lock: No Auto-Off While Charging. Please install that package instead. Prevents the screen from turning off while the device is charging.
CATEGORY = Obsolete
VERSIONS = 1.3.1-99 1.3.5-99
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
META_SUB_VERSION=3

include ../common.mk
include ../../support/download.mk

DEPENDS = org.webosinternals.patches.screen-lock-no-auto-off-while-charging

build/all/CONTROL/postinst:
	touch $@
	echo "#!/bin/sh" >> $@
	echo "return 1" >> $@
	chmod ugo+x $@

build/all/CONTROL/prerm:
	rm -rf build/all/CONTROL/prerm

build/.built-${VERSION}:
	touch $@

build/.unpacked-${VERSION}:
	rm -rf build/all
	mkdir -p build/all
	touch $@
