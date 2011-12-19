NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TWEAKS =
TITLE = Google Calendar Login Fix
DESCRIPTION = If your Google password contains one of the following characters: , ^, $, *, ?, ., (, {, [, ], }, ) calendar sync may fail to authorise.This patch changes how the authentication details are handled and should fix this issue.
CATEGORY = Calendar
VERSIONS = 2.1.0-224 2.1.1-31
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Julian Calaby <julian.calaby+webos@gmail.com>
HOMEPAGE = http://forums.webosnation.com/webos-patches/308849-patch-2-1-0-fix-login-google-calendar-when-passwords-contain-certain-characters.html