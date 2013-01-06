NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS = messaging/${NAME}.json
TITLE = SMS Vibrate
DESCRIPTION = Permits the modification of the vibration pattern for SMS messages using Tweaks. By default or without Tweaks installed this patch gives a 2 second vibrate when a new text message is received and the messaging app does not have focus. It also will not vibrate if vibrate is disabled by a setting or when you are on an active phone call. This has only been tested on the Pre3 running 2.2.4!
CATEGORY = Messaging
VERSIONS = 2.2.4-88
ICON = http://www.webos-internals.org/images/0/04/Icon_WebOSInternals_Patches_Plus_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = nickpl <patch@a-moron.com>
HOMEPAGE = http://forums.webosnation.com/webos-patches/321012-patch-sms-vibrate-w-tweaks-support.html