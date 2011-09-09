NAME = $(shell basename $(shell pwd))
PATCH = screen-lock/${NAME}.patch
TWEAKS =
TITLE = Reduce Min Brightness to 5
DESCRIPTION = This will give the ability to lower the brightness of the backlight to the bare minimum. Changes minimum for '10' to '5'. Maximum is still '100'. Your current setting is not changed. You have to adjust it manually in the Screen & Lock application. 5 is the min brightness where the keyboard backlight still works on the Pre.
CATEGORY = Screen Lock
VERSIONS = 1.4.5-135 2.1.0-16 2.2.0-17
ICON = http://www.webos-internals.org/images/f/fa/Icon_WebOSInternals_Patches_Screenlock.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Hopspitfire <support@canuck-software.ca>, Jason Robitaille, codecrumb
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_webOS_Brightness