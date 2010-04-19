NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TITLE = Notification Repeat German Localisation
DESCRIPTION = German locale for the Calendar Notification Repeat patch. For a full description see Calendar Notification Repeat patch. Depends on the Calendar Notification Repeat patch.
CATEGORY = Calendar
VERSIONS = 1.4.0-38 1.4.1-7
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/e/ee/Calendar-notification-repeat-german-localisation-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk
DEPENDS := ${DEPENDS}, org.webosinternals.patches.calendar-notification-repeat
include ../modifications.mk

MAINTAINER = sockenfresser
HOMEPAGE =