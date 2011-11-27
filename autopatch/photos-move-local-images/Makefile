NAME = $(shell basename $(shell pwd))
PATCH = photos/${NAME}.patch
TWEAKS =
TITLE = Move Local Images
DESCRIPTION = In the Photos & Videos application, 'Add to Image' copies files even in the case of local->local transfers. This patch modifies this behaviour so transfers from local to local become moves. All other transfers should be unaffected.
CATEGORY = Photos
VERSIONS = 3.0.2-26
ICON = http://www.webos-internals.org/images/7/7d/Icon_WebOSInternals_Patches_Photos.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Havvoric <havvoric@gmail.com>
HOMEPAGE =