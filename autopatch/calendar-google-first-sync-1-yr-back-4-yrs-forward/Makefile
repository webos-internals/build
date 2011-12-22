NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TITLE = Google first sync 1 yr back 4 yrs forward
DESCRIPTION = This modifies the google sync limits.  You must disable the google calendars in the accounts app, apply the patch, then restart Luna.  If you have many google calendars, enable them one at a time.  The first sync is best done over wifi especially if you have a lot of events.
CATEGORY = Calendar
VERSIONS = 2.1.0-3 2.1.1-22 2.1.2-31
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = frantid
HOMEPAGE = http://forums.precentral.net/webos-patches/276699-google-first-sync-patch.html
