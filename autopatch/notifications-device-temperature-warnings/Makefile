NAME = $(shell basename $(shell pwd))
PATCH = notifications/${NAME}.patch
TITLE = Device Temperature Warnings
DESCRIPTION = This will check the battery temperature every 5 minutes and will issue a warning at 45C and a different, more serious warning if it reaches 50C. Both temperatures are the general maximum you should have. Higher temperatures can lead to device bricking.
CATEGORY = Notifications
VERSIONS = 1.4.5-1 2.0.1-45 2.1.0-3
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/238399-patch-device-temperature-warnings.html