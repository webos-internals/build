NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
TWEAKS = system/${NAME}.json
TITLE = Tweak calendar and contacts sync frequency
DESCRIPTION = This patch, which requires Tweaks, allows you to change the calendar/contacts sync frequency to 15m, 20m, 30m, 1h, 3h, 6h, 24h, or 48h. It also allows you to disable syncing when wifi is not available, or when the battery is below some percentage. Applies to Google, Yahoo, LinkedIn, and Facebook, but not Exchange (EAS).
CATEGORY = System
VERSIONS = 2.2.4-81
ICON = http://www.webos-internals.org/images/f/f1/Icon_WebOSInternals_Patch_Plus.png
SCREENSHOTS = [ \"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = greenoyster
HOMEPAGE = http://forums.webosnation.com/webos-patches/316853-patch-change-calendar-contact-sync-frequency-2-2-4-testers-wanted.html