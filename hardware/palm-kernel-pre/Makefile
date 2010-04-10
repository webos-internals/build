NAME = $(shell basename $(shell pwd))
TITLE = Stock Kernel (Palm Pre)
DESCRIPTION = An unmodified stock kernel package.  Useful for putting your device back the way it was.
CATEGORY = Hardware-Related
# VERSIONS = 1.4.0-0
VERSION = 1.4.1-1
ICON = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
SCREENSHOTS = 
META_SUB_VERSION = 1

KERNEL_PATCHES =

PACKAGES = ipkgs/${APP_ID}_${VERSION}_armv7.ipk

include ../common.mk

APP_ID = org.webosinternals.kernels.${NAME}
MAINTAINER = WebOS Internals
HOMEPAGE = http://opensource.palm.com
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice

include ../../support/cross-compile.mk

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

include ../kernel.mk

build/armv7/CONTROL/postinst:
	mkdir -p build/armv7/CONTROL
	sed -e 's|PID=|PID="${APP_ID}"|' ../postinst.kernel > $@
	chmod ugo+x $@

build/armv7/CONTROL/prerm:
	rm -f $@
