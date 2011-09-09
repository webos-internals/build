NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TWEAKS = calendar/${NAME}.json
TITLE = Google Sync Behaviors Patch
DESCRIPTION = Do Not Apply to USA Veer!!The sync behavior patch attempts to solve issues with Google calendar syncIt is a combined update of the patches for 2.1 in the Google first Sync thread. Also see that thread for detailed sync descriptions and history.Issues addressed:Limited first sync to 3 months - This patch defaults to 1 year back and 4 years forward. It is Tweaks enabled, but will work at the defaults if you don't have Tweaks installed.Recurring event exceptions not syncing to GoogleEvents with accented characters do not sync.Sync does not restart after sync error - adjustments based upon the Veer's sync behavior. It will attempt a range based sync if it cannot get a changes sync to be error free.
CATEGORY = Calendar
VERSIONS = 2.1.0-141 3.0.2-24
ICON = 
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = frantid
HOMEPAGE = http://forums.precentral.net/webos-patches/286029-google-calendar-sync-behaviors-patch.html