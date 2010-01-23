NAME = $(shell basename $(shell pwd))
PATCH = camera/$(shell basename ${NAME} -green).patch
TITLE = Sound Toggle - Green
DESCRIPTION = This will add a green button in the Camera application that will allow you to turn the shutter sound On and Off.
CATEGORY = Camera
VERSIONS = 1.2.1-2 1.1.3-2 1.3.1-28 1.3.5-11
ICON = http://www.webos-internals.org/images/c/c5/Icon_WebOSInternals_Patches_Camera.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/9/96/Shutter-sound-on-off-button-green-1.png\",\
\"http://www.webos-internals.org/wiki/Image:Shutter-sound-on-off-button-green-2.png\"]
META_SUB_VERSION = 1
include ../common.mk
include ../modifications.mk

build/.built-extra-${VERSION}:
	install -m 644 *.png build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *_extra build/all/usr/palm/applications/${APP_ID}/
	touch $@

MAINTAINER = Hopspitfire, dBsooner <webos@dbsooner.com>
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Camera_Shutter_Sound_On-Off_Button
