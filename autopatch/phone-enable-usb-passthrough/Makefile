NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TWEAKS =
TITLE = Enable USB Passthrough
DESCRIPTION = This patch does two things:1) Bypasses the validation screen, so you no longer have to enter a code.2) Adds the USB Passthrough icon to the launcher, so you no longer have to manually enter the USBPASS code.This is useful to enable Diagnostics mode for modifications such as enabling standalone GPS.There are also a couple of interesting modes in USB Passthrough including a GPS mode and USBNet.
CATEGORY = Phone
VERSIONS = 2.1.0-19 2.2.0-17 3.0.2-12 3.0.4-14
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/f/f7/Phone-enable-usb-passthrough-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Ebag333 <ebagola@gmail.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/223956-patch-usb-passthrough-remove-code-add-launcher-usbpass.html