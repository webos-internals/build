NAME = $(shell basename ${PWD})
PATCH = /camera/${NAME}.patch
TITLE = Shutter Sound On/Off Button
DESCRIPTION = This will add a button in the Camera application that will allow you to turn the shutter sound On and Off.
CATEGORY = Camera
VERSION = 0.5.0
ICON = http://www.webos-internals.org/images/c/c5/Icon_WebOSInternals_Patches_Camera.png

include ../common.mk
include ../modifications.mk

build/.built: build/.unpacked
	rm -rf build/all
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	install -m 644 build/src/${PATCH} build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *.png build/all/usr/palm/applications/${APP_ID}/
	install -m 644 *_extra build/all/usr/palm/applications/${APP_ID}/
	touch $@
