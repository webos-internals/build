NAME = $(shell basename $(shell pwd))
TITLE = Kernel (Pixi/Pixi+)
DEVICE = pixi
CATEGORY = Stable
VERSIONS = 1.4.5-1 1.4.5.1-1
APPINFO_DESCRIPTION = Stock webOS kernel, rebuilt from source.
DESCRIPTION = ${APPINFO_DESCRIPTION}<br>${KERNEL_DISCLAIMER}
APPINFO_CHANGELOG = [ \
{ "version" : "${WEBOS_VERSION}-1", "log" : [ "Initial public release" ] }, \
]
CHANGELOG = \
${WEBOS_VERSION}-1: Initial public release

TYPE = Kernel

KERNEL_GIT = git@github.com:webos-internals/webos-linux-kernel.git
KERNEL_TAG = webos-${WEBOS_VERSION}-${DEVICE}

include ../../support/kernel.mk
