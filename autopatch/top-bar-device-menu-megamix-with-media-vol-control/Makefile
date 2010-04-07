NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = Device Menu Megamix with Media Vol Control
DESCRIPTION = Expands on Jason's outstanding DM Megamix by adding a media volume control.<br/><br/>Here's the overall changes to the device menu…<br/><br/>Removes: date and battery level & the airplane mode toggle<br/><br/>Adds: brightness control; media volume control; phone submenu with radio/data/roaming toggles; GPS toggle; flashlight led toggle
CATEGORY = Top Bar
VERSIONS = 1.4.0-36
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/f/f9/Top-bar-device-menu-megamix-with-media-vol-control-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS},ca.canucksoftware.systoolsmgr,org.webosinternals.patches.top-bar-device-menu-megamix
include ../modifications.mk

MAINTAINER = xanthinealkaloid <hardfam1@gmail.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/236356-patch-jasons-device-menu-megamix-media-volume-control-added.html
