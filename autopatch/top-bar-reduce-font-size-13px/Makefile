NAME = $(shell basename $(shell pwd))
PATCH = top-bar/${NAME}.patch
TITLE = Reduce Font Size 13px
DESCRIPTION = Reduces the font size to 13px for top bar carrier string, app name, time, date if date patch is installed, and battery percent if battery percent patch is installed. This does not depend on any other patches being install and shouldn't conflict with any other patches unless one also modifies the same font sizes.
CATEGORY = Top Bar
VERSIONS = 1.4.0-70 1.4.1-43 1.4.2-29 1.4.3-23 1.4.5-30
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = StoneRyno
HOMEPAGE = http://forums.precentral.net/webos-patches/258552-patches-reduce-font-size-top-bar-12px-13px.html