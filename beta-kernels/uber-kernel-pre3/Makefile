NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre3)
DEVICE = pre3
CATEGORY = Stable
VERSIONS = 2.2.0-5 2.2.3-5
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre3, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
This package is compatible only with webOS 2.2.0 build 3171 (the build for which the webOS Doctor exists). If you have a device with a different build number, you will need to doctor it before installing this package.<br>\
Current additions include:<ul>\
<li>Modification of the lowmemnotify threshold calculation to take into account free swap space. This reduces the occurrence of the Too Many Cards error.</li>\
<li>A new <a href=http://lwn.net/Articles/334649/><b>compcache</b> compressed RAM swap kernel module</a> ported to the Palm Pre 3. This effectively increases your available swap space, at the expense of access speed.</li>\
<li>Support for kernel crypto modules required by TrueCrypt</li>\
</ul><br>\
All additions are controlled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-5", "log" : [ "Added the lowmemnotify threshold calculation modification" ] }, \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-5: Added the lowmemnotify threshold calculation modification.<br>\
${WEBOS_VERSION}-4: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = makefiletune/armMakefile.diff \
		 bfq/bfq-iosched.patch \
		 identification/mkcompile_h.patch \
		 compcache/lowmemnotify-total-memory.patch \
		 crypto/hw-support-pre3.patch \
		 crypto/truecrypt-support-pre3.patch

EXTERNAL_MODULES = compcache/compcache-1.0.0
TYPE = Kernel

include ../../support/kernel.mk
