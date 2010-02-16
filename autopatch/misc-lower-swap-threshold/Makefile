NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = Lower Swap Threshold
DESCRIPTION = Changes the luna.conf line FreeSwapThreshold=64 to be FreeSwapThreshold=32 (giving apps an extra 32mb of ram - or roughly 2-3 apps more).
CATEGORY = Misc
VERSIONS = 1.2.1-13 1.3.1-3
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

MAINTAINER = diomark, Jason Robitaille
HOMEPAGE = http://forums.precentral.net/web-os-development/209492-possible-resolution-too-many-cards-error.html
