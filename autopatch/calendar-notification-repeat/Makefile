NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TITLE = Repeat Reminder Notifys
DESCRIPTION = This patch will repeat the reminder notification every 2 minutes until you either dismiss or snooze the reminder.
CATEGORY = Calendar
IPKG_VERSION = 2
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
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
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Calendar_Notification_Repeat
