NAME = $(shell basename $(shell pwd))
PATCH = camera/${NAME}.patch
TWEAKS = camera/${NAME}.json
TITLE = Advanced Camera Configuration
DESCRIPTION = This patch consolidates the following patches into a single tweaks patch:<br/>camera-capture-with-volume-keys<br/>camera-simple-shutter-sound-off<br/>camera-video-camera-flashlight<br/>camera-timer-burst
CATEGORY = Camera
VERSIONS = 2.1.0-125
ICON = http://www.webos-internals.org/images/2/2f/Icon_WebOSInternals_Patches_Plus_Camera.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, ca.canucksoftware.systoolsmgr
include ../modifications.mk

MAINTAINER = Error 454 <zachary.burke@gmail.com>
HOMEPAGE = http://mobilecoder.wordpress.com/2011/07/10/webos-camera-patch-self-timer-and-burst-frames/