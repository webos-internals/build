NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre/Pre+)
CATEGORY = Experimental
VERSIONS = 1.4.1-36 1.4.2-36 1.4.5-36
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre/Pre+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to void your warranty if things go wrong.<b><br>\
Current additions include:<ul>\
<li>720MHz and 800MHz kernel operating points (OPP6 and OPP7 for VDD1), based on the open source OMAP3440 kernel port, ported to the Palm Pre/Pre+ by uNiXpSyChO</li>\
<li>All standard Linux 2.6.24 cpufreq governors made available for selection via the Govnah application</li>\
<li>The OMAP3430 internal CPU temperature sensor is made available for measuring the true CPU temperature, ported to the Palm Pre/Pre+ by ka6sox & rwhitby</li>\
<li>A new <b>screenstate</b> governor created by uNiXpSyChO specifically for the Palm Pre/Pre+ which runs at a higher speed when the screen is on, and a lower speed when the screen is off</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-36", "log" : [ "Added lowmemory notify calculation correction patch" ] }, \
{ "version" : "${WEBOS_VERSION}-35", "log" : [ "Added initial infrastructure for compcache" ] }, \
{ "version" : "${WEBOS_VERSION}-32", "log" : [ "Update and cleanup of charging code in screenstate governor" ] }, \
{ "version" : "${WEBOS_VERSION}-21", "log" : [ "Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch" ] }, \
{ "version" : "${WEBOS_VERSION}-16", "log" : [ "Improved screenstate transition detection" ] }, \
{ "version" : "${WEBOS_VERSION}-13", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-36: Added lowmemory notify calculation correction patch.<br>${WEBOS_VERSION}-35: Added initial infrastructure for compcache.<br>${WEBOS_VERSION}-32: Update and cleanup of charging code in screenstate governor.<br>${WEBOS_VERSION}-21: Limit IVA2 block to 360MHz as per the mystery bug mentioned in the Palm kernel patch.<br>${WEBOS_VERSION}-16: Improved screenstate transition detection.<br>${WEBOS_VERSION}-13: Initial public release

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = overclocking/opp6-720-opp7-800-min-opp5.patch overclocking/defconfig-safe.patch \
		 sensors/sensors_temp_omap34xx.patch sensors/defconfig-safe.patch \
		 screenstate/screenstate.patch screenstate/defconfig-safe.patch \
		 compcache/compcache.patch compcache/lowmemnotify-total-memory.patch
KERNEL_MODULES = compcache/compcache-0.5.4

include ../../support/kernel.mk

ifeq ("${WEBOS_VERSION}", "1.4.5")

CATEGORY = Temporary
TEMPVER  = 1.4.1

KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${TEMPVER}/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${TEMPVER}/linuxkernel-${KERNEL_VERSION}-patch\(pre\).gz

build/.unpacked-${VERSION}: ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}.tgz \
			    ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}-patch-pre.gz \
			    ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}/patches
	tar -C build/src-${VERSION} -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}.tgz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}-patch-pre.gz | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 
	tar -C build/src-${VERSION}/patches -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit ; \
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@

endif

