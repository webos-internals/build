NAME = $(shell basename $(shell pwd))
TITLE = Uber-Kernel (Palm Pre)
DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to void your warranty if things go wrong.<b><br>\
Current additions include:<ul>\
<li>720MHz and 800MHz operating points (OPP6 and OPP7 for VDD1), based on the open source OMAP3440 kernel port, modified for the Palm Pre kernel by uNiXpSyChO</li>\
<li><a href=http://kernel.org/pub/linux/kernel/people/lenb/acpi/doc/OLS2006-ondemand-paper.pdf>Ondemand dynamic in-kernel cpufreq governor</a> that can change CPU frequency depending on CPU utilization (a standard part of the open source Linux kernel, compiled for Palm Pre kernel by uNiXpSyChO)</li>\
</ul>\
WebOS Internals provides this Uber-Kernel as is without warranty of any kind, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose.  The entire risk as to the quality and performance of Uber-Kernel is with you.  Should Uber-Kernel prove defective, you assume the cost of all necessary servicing, repair or correction.<br>\
In no event will WebOS Internals or any other party be liable to you for damages, including any general, special, incidental or consequential damages arising out of the use or inability to use Uber-Kernel (including but not limited to loss of data or data being rendered inaccurate or losses sustained by you or third parties or a failure of Uber-Kernel to operate with any other programs).
CATEGORY = Hardware-Related
# VERSIONS = 1.4.0-0
VERSION = 1.4.1-1
ICON = http://www.webos-internals.org/images/8/8d/Icon_WebOSInternals_WebOSInternals.png
SCREENSHOTS = 
META_SUB_VERSION = 1

KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch

PACKAGES = ipkgs/${APP_ID}_${VERSION}_armv7.ipk

include ../common.mk
include ../kernel.mk

MAINTAINER = WebOS Internals
HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
POSTINSTALLFLAGS = RestartDevice
POSTUPDATEFLAGS  = RestartDevice
POSTREMOVEFLAGS  = RestartDevice

include ../../support/cross-compile.mk

APP_DIR = $(shell pwd)/build/armv7/usr/palm/applications/${APP_ID}

build/.built-${VERSION}: build/.unpacked-${VERSION}
	mkdir -p build/armv7/usr/palm/applications/${APP_ID}/additional_files/boot
	( cd build/src-${VERSION}/linux-${KERNEL_VERSION} ; \
	  yes '' | ${MAKE} ARCH=arm omap_sirloin_3430_defconfig ; \
	  ${MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE_armv7} \
		INSTALL_MOD_PATH=${APP_DIR}/additional_files \
		uImage modules modules_install ; \
	)
	rm -f ${APP_DIR}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/build
	rm -f ${APP_DIR}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/source
	rm -f ${APP_DIR}/additional_files/lib/modules/${KERNEL_VERSION}-palm-joplin-3430/*.bin
	cp build/src-${VERSION}/linux-${KERNEL_VERSION}/arch/arm/boot/uImage \
		${APP_DIR}/additional_files/boot/uImage-2.6.24-palm-joplin-3430
	touch $@

build/armv7/CONTROL/postinst:
	mkdir -p build/armv7/CONTROL
	sed -e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
		../postinst${SUFFIX} > $@
	chmod ugo+x $@

build/armv7/CONTROL/prerm:
	mkdir -p build/armv7/CONTROL
	sed -e 's|APP_DIR=|APP_DIR=$$IPKG_OFFLINE_ROOT/usr/palm/applications/${APP_ID}|' \
		../prerm${SUFFIX} > $@
	chmod ugo+x $@
