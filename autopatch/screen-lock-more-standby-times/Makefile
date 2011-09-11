NAME = $(shell basename $(shell pwd))
PATCH = screen-lock/${NAME}.patch
TWEAKS =
TITLE = More Standby Times
DESCRIPTION = This will add more standby times to the Screen & Lock application. New settings will be 15 seconds, 3 minutes, 5 minutes and never. This will not change your standby time automatically. You will have to select the length you desire in the Screen & Lock application.
CATEGORY = Screen Lock
VERSIONS = 1.4.5-170 2.1.0-160
ICON = http://www.webos-internals.org/images/f/fa/Icon_WebOSInternals_Patches_Screenlock.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/4/4f/Longer-standby-times.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = jcrawford, Jason Robitaille
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_webOS_Changing_the_%22Turn_off_after_X%22_time