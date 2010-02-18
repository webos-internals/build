NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = Device Menu Megamix
DESCRIPTION = Removes the date and battery level, adds brightness control, adds phone submenu with radio/data/roaming toggles, adds GPS toggle, removes the airplane mode toggle, and adds a flashlight led toggle, on the device menu.
CATEGORY = Top Bar
VERSIONS = 1.3.1-30 1.3.5-13 1.4.0-12
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/222295-patch-device-menu-megamix.html