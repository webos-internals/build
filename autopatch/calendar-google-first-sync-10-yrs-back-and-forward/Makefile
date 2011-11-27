NAME = $(shell basename $(shell pwd))
PATCH = calendar/${NAME}.patch
TWEAKS =
TITLE = Google first sync 10 yrs back and forward
DESCRIPTION = This modifies the google sync limits to sync 10 years back and forward from your Google Calendar (as opposed to the default 1 month back/2 months foward). You must disable the google calendars in the accounts app, apply the patch, then restart Luna. If you have many google calendars, enable them one at a time. The first sync is best done over wifi especially if you have a lot of events.<br/><br/>This patch was based off frantid's patch for 1yr back/4 yrs forward
CATEGORY = Calendar
VERSIONS = 2.1.0-105
ICON = http://www.webos-internals.org/images/d/d4/Icon_WebOSInternals_Patches_Calendar.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Audemars02 frantid <adam.marks@precentral.net>
HOMEPAGE =