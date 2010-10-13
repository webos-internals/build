NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = Ringtone for Unknown Callers
DESCRIPTION = Here's a requested patch to have a separate ringtone for unknown/blocked callers. The normal default ringtone will still be used for those in your contact list that you haven't specified a ringtone for, but those not in your contact list will default to the one you set here. This is especially useful for those with very long contact list and don't want to spend hours specifying a ringtone for each.<br/><br/>Instructions: put phone in usb mode, save the ringtone you want for unknown callers to the ringtones directory (make sure it's an mp3) and rename it:<br/>'ringtoneforunknown' (no quotes). Install patch with webosqi, or preware (when it's available on feed)
CATEGORY = Phone
VERSIONS = 1.4.5-1
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Elryon <elryon@gmail.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/236828-patch-separate-ringtone-unknown-blocked-calers.html
