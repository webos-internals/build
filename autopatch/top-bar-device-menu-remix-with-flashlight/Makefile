NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TWEAKS =
TITLE = Device Menu Remix with Flashlight
DESCRIPTION = Removes the date, undims the battery level, adds brightness control, adds GPS toggle, removes the VPN and airplane mode toggles, and adds a flashlight led toggle, on the device menu.
CATEGORY = Top Bar
VERSIONS = 2.1.0-3 2.1.1-22 2.1.2-31 2.2.0-19 2.2.3-19 2.2.4-14
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/222052-patch-device-menu-remix-flashlight.html