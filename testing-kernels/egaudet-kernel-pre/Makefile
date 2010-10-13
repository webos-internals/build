NAME = $(shell basename $(shell pwd))
TITLE = egaudet kernel (Pre/Pre+)
DEVICE = pre
CATEGORY = Experimental
VERSIONS = 1.4.5-101
APPINFO_DESCRIPTION = It is what it is
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-101", "log" : [ "Add prox_timeout sysfs entry to disable adjacent keys being dropped" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-101: Add prox_timeout sysfs entry to disable adjacent keys being dropped.
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
SRC_GIT = git://git.webos-internals.org/kernels/patches.git
KERNEL_PATCHES = keypad/maxim7359-keypad.patch
TYPE = Kernel

include ../../support/kernel.mk
