NAME = $(shell basename $(shell pwd))
TITLE = UberKernel (Pre3)
DEVICE = pre3
CATEGORY = Experimental
VERSIONS = 2.2.0-4
APPINFO_DESCRIPTION = A collection of all the best kernel improvements for the Palm Pre3, rolled into a single OTA-safe installation package.<br>\
<b>Note that usage of this package is very likely to <a href=http://developer.palm.com/blog/2010/03/a-statement-on-the-overclocking-patches/>void your warranty</a> if things go wrong.</b><br>\
Current additions include:<ul>\
</ul><br>\
All additions are disabled by default, and must be enabled by using the Govnah application.<br>\
For more information, visit <a href=${HOMEPAGE}>${HOMEPAGE}</a>
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-4", "log" : [ "Initial version" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-4: Initial version.

HOMEPAGE = http://www.webos-internals.org/wiki/Application:UberKernel
SRC_GIT = git://git.webos-internals.org/kernels/patches.git

KERNEL_PATCHES = makefiletune/armMakefile.diff \
		 bfq/bfq-iosched.patch \
		 identification/mkcompile_h.patch \
		 psychobuild/fbconsole.patch \
		 crypto/hw-support-pre3.patch \
		 crypto/truecrypt-support-pre3.patch

#		 compcache/lowmemnotify-total-memory.patch \

EXTERNAL_MODULES = compcache/compcache-1.0.0
TYPE = Kernel

include ../../support/kernel.mk
