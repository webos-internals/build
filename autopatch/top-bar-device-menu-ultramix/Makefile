NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = Device Menu Ultramix
DESCRIPTION = Adds on the device menu: brightness control, data, gps, flashlight.  Removes from device menu: battery level, airplane mode.  All credit to original patch creators, with special thanks to Jason Robitaille for Unified Diff Creator.  This patch requires Jason's systoolsmgr service to function correctly.
CATEGORY = Top Bar
VERSIONS = 1.3.5-21 1.4.0-24 v1.4.1-1
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/2/27/Top-bar-device-menu-ultramix-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = cwgtex
HOMEPAGE = http://forums.precentral.net/webos-patches/228595-patch-device-menu-ultramix.html
