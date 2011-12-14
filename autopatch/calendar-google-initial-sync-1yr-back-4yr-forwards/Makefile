NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TITLE = Google Initial Sync 1yr Back 4yr Forwards
DESCRIPTION = Default google sync behavior -- limits are 1 month back and 2 months forward on the first sync. All other syncs are change syncs. No matter how far in the past or in the future your event is, if you change the event after your first sync is completed -- it will show up in your calendar the next time it syncs.<br/><br/><br/>Patch google sync behavior -- limits are 1 year back and 4 years forward on the first sync. All other syncs are the same as above.
CATEGORY = Calendar
VERSIONS = 2.0.1-53
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = frantid
HOMEPAGE = http://forums.precentral.net/webos-patches/276699-google-first-sync-patch.html
