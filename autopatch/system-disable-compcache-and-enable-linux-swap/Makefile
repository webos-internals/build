NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
TWEAKS =
TITLE = Disable Compcache and enable linux Swap
DESCRIPTION = This patch will disable compcache and enable linux swap on webOS devices. It has been found that linux swap is faster than the 'backing store' method that Palm has setup with webOS, especially when disabling compcache.
CATEGORY = System
VERSIONS = 2.2.0-89 2.2.3-83
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = mau
HOMEPAGE =