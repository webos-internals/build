NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TWEAKS =
TITLE = Device Menu Megamix with Media Vol Control
DESCRIPTION = Removes: date and battery level & the airplane mode toggle<br/><br/>Adds: brightness control; media volume control; phone submenu with radio/data/roaming toggles; GPS toggle; flashlight led toggle
CATEGORY = Top Bar
VERSIONS = 2.1.0-124
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/f/f9/Top-bar-device-menu-megamix-with-media-vol-control-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = xanthinealkaloid, Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/236356-patch-jasons-device-menu-megamix-media-volume-control-added.html