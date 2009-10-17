NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TITLE = Snooze Duration Selection
DESCRIPTION = Adds a snooze duration selection to the reminder notification. Currently it the list will not scroll so the snooze duration options are limited to only four durations.
CATEGORY = Calendar
WEBOS_VERSION = 1.2.1
IPKG_VERSION = 2
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/b/b4/Readalldelall-1.png\",\
\"http://www.webos-internals.org/images/7/7b/Readalldelall-2.png\",\
\"http://www.webos-internals.org/images/d/dd/Readalldelall-3.png\"]
META_SUB_VERSION = 1
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna

include ../common.mk
include ../modifications.mk

MAINTAINER = Lclarkjr
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Calendar_Snooze_Duration_Selection
