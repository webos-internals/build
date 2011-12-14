NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TWEAKS =
TITLE = Device Menu Remix
DESCRIPTION = Removes the date, undims the battery level, adds brightness control, adds GPS toggle, and removes the VPN and airplane mode toggles, on the device menu.
CATEGORY = Top Bar
VERSIONS = 2.1.0-3 2.1.1-22 2.1.2-31 2.2.0-19 2.2.3-19
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/8/86/Top-bar-device-menu-remix-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/217216-patch-device-menu-remix.html
