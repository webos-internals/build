NAME = $(shell basename $(shell pwd))
PATCH = camera/$(shell basename ${NAME} -grey).patch
TITLE = Sound Toggle - Grey
DESCRIPTION = This will add a grey button in the Camera application that will allow you to turn the shutter sound On and Off.
CATEGORY = Camera
VERSIONS = 1.2.1-0 1.1.3-0 1.3.1-27 1.3.5-10
ICON = http://www.webos-internals.org/images/c/c5/Icon_WebOSInternals_Patches_Camera.png
SCREENSHOTS = [\"http://www.webos-internals.org/images/1/13/Shutter-sound-on-off-button.png\"]
META_SUB_VERSION = 1
include ../common.mk
include ../modifications.mk

build/.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 build/src-${VERSION}/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *.png build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *_extra build/all/usr/palm/applications/${APP_ID}/
	touch $@

MAINTAINER = Hopspitfire, dBsooner <webos@dbsooner.com>
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Camera_Shutter_Sound_On-Off_Button
