NAME = $(shell basename $(shell pwd))
PATCH = camera/${NAME}.patch
TWEAKS =
TITLE = Video Camera Flashlight
DESCRIPTION = Adds a flashlight toggle in the video recorder of the camera app.
CATEGORY = Camera
VERSIONS = 2.1.0-12 2.1.1-22 2.1.2-31 2.2.0-52 2.2.3-46 2.2.4-14
ICON = http://www.webos-internals.org/images/c/c5/Icon_WebOSInternals_Patches_Camera.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/232995-patch-video-camera-flashlight.html