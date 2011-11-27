NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TWEAKS =
TITLE = Flashlight in Device Menu
DESCRIPTION = Adds a flashlight toggle to the device menu.
CATEGORY = Top Bar
VERSIONS = 2.1.0-12 2.2.0-51 2.2.3-45
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/222294-patch-flashlight-device-menu.html