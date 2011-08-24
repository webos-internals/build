NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TWEAKS = calendar/${NAME}.json
TITLE = Google Sync Behaviors Patch
DESCRIPTION = Do Not Apply to USA Veer!!<br/><br/>The sync behavior patch attempts to solve issues with Google calendar sync on webOS 2.1.<br/><br/>Currently the patch is only for 2.1 non-Veer devices. It is a combined update of the patches for 2.1 in the Google first Sync thread. Also see that thread for detailed sync descriptions and history.<br/><br/>Issues addressed:<br/>Limited first sync to 3 months - This patch defaults to 1 year back and 4 years forward. It is Tweaks enabled, but will work at the defaults if you don't have Tweaks installed.<br/><br/>Recurring event exceptions not syncing to Google<br/><br/>Events with accented characters do not sync.<br/><br/>Sync does not restart after sync error - adjustments based upon the Veer's sync behavior. It will attempt a range based sync if it cannot get a changes sync to be error free.
CATEGORY = Calendar
VERSIONS = 2.1.0-141
ICON = 
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = frantid
HOMEPAGE = http://forums.precentral.net/webos-patches/286029-google-calendar-sync-behaviors-patch.html