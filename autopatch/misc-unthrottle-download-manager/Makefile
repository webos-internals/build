NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TWEAKS =
TITLE = Unthrottle Download Manager
DESCRIPTION = This patch significantly speeds up downloads, especially over wifi. The Pre comes stock limited to 64kb/sec downloads (noticeable especially in DrPodder/etc) - this patch unthrottles it.
CATEGORY = Misc
VERSIONS = 1.4.5-170 2.1.0-160 2.2.0-21 3.0.2-26 3.0.4-5
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = diomark, Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/210774-patch-unthrottle-download-manager.html