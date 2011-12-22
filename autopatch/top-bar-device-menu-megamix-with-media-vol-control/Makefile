NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TWEAKS =
TITLE = Device Menu Megamix with Media Vol Control
DESCRIPTION = Removes: date and battery level & the airplane mode toggleAdds: brightness control; media volume control; phone submenu with radio/data/roaming toggles; GPS toggle; flashlight led toggle
CATEGORY = Top Bar
VERSIONS = 2.1.0-124 2.1.1-22 2.1.2-31 2.2.0-19 2.2.3-19 2.2.4-14
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/f/f9/Top-bar-device-menu-megamix-with-media-vol-control-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr,org.webosinternals.patches.top-bar-device-menu-megamix
include ../modifications.mk

MAINTAINER = xanthinealkaloid, Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/236356-patch-jasons-device-menu-megamix-media-volume-control-added.html