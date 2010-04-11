NAME = $(shell basename $(shell pwd))
TITLE = Stock Kernel (Palm Pre)
DESCRIPTION = An unmodified stock kernel package.<br>\
Useful for restoring the operation of your device back to factory specifications.<br>${KERNEL_DISCLAIMER}
CATEGORY = Hardware-Related
# VERSIONS = 1.4.0-0
VERSION = 1.4.1-1
ICON = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
SCREENSHOTS = 
META_SUB_VERSION = 1

PACKAGES = ipkgs/${APP_ID}_${VERSION}_armv7.ipk

KERNEL_PATCHES =

include ../common.mk
include ../kernel.mk

HOMEPAGE = http://opensource.palm.com

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/armv7/CONTROL/postinst:
	mkdir -p build/armv7/CONTROL
	sed -e 's|PID=|PID="${APP_ID}"|' ../postinst.kernel > $@
	chmod ugo+x $@

build/armv7/CONTROL/prerm:
	rm -f $@
