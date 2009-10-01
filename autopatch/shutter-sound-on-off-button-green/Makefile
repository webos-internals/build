NAME = shutter-sound-on-off-button-green
PATCH = /camera/shutter-sound-on-off-button.patch
TITLE = Add (green) shutter sound on/off button
DESCRIPTION = Adds green shutter sound on/off button to camera app
CATEGORY = Camera
VERSION = 0.2.5
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
