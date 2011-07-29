NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = Device Menu Remix with Flashlight
DESCRIPTION = Removes the date, undims the battery level, adds brightness control, adds GPS toggle, removes the VPN and airplane mode toggles, and adds a flashlight led toggle, on the device menu.
CATEGORY = Top Bar
VERSIONS = 1.4.5-1 2.0.1-45 2.1.0-3
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/222052-patch-device-menu-remix-flashlight.html