NAME = $(shell basename $(shell pwd))
PATCH = notifications/${NAME}.patch
TWEAKS =
TITLE = Advanced Reset Options
DESCRIPTION = On power button hold, the options will be airplaine mode, luna restart, device restart, shut down, and cancel.
CATEGORY = Notifications
VERSIONS = 2.1.0-3 2.2.0-19 3.0.2-3 3.0.4-5
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS = [ \"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/288393-patch-touchpad-advanced-reset-options.html