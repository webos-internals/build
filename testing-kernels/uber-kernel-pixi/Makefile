NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pixi/Pixi+)
DEVICE   = pixi
CATEGORY = Experimental
VERSIONS = 1.4.1-40 1.4.3-40 1.4.5-40
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pixi/Pixi+, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.<b><br>\
Current additions include:<ul>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pixi/Pixi+ by uNiXpSyChO & rwhitby</li>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space, written by rwhitby</li>\
</ul><br>\
All additions are disabled by default, and must be enabled by separate packages or scripts (not included in this package).<br>\
For more information, visit ${HOMEPAGE}
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-40", "log" : [ "First Pixi custom kernel" ] }, \
]
CHANGELOG = ${WEBOS_VERSION}-40: First Pixi custom kernel

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = compcache/compcache.patch compcache/lowmemnotify-total-memory.patch
KERNEL_MODULES = compcache/compcache-0.5.4

include ../../support/kernel.mk

ifeq ("${WEBOS_VERSION}", "1.4.5")

CATEGORY = Temporary
TEMPVER  = 1.4.1

KERNEL_SOURCE = http://palm.cdnetworks.net/opensource/${TEMPVER}/linuxkernel-${KERNEL_VERSION}.tgz
KERNEL_PATCH  = http://palm.cdnetworks.net/opensource/${TEMPVER}/linuxkernel-${KERNEL_VERSION}-patch\(${DEVICE}\).gz

build/.unpacked-${VERSION}: ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}.tgz \
			    ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}-patch-${DEVICE}.gz \
			    ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/src-${VERSION}
	mkdir -p build/src-${VERSION}/patches
	tar -C build/src-${VERSION} -xf ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}.tgz
	zcat ${DL_DIR}/linuxkernel-${KERNEL_VERSION}-${TEMPVER}-patch-${DEVICE}.gz | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 
	tar -C build/src-${VERSION}/patches -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	if [ -n "${KERNEL_PATCHES}" ] ; then \
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} > /dev/null ) || exit ; \
	  ( cd build/src-${VERSION}/patches ; cat ${KERNEL_PATCHES} ) | \
		patch -d build/src-${VERSION}/linux-${KERNEL_VERSION} -p1 ; \
	fi
	touch $@

endif

