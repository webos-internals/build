NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = Disable Abandoned Forwards in New Messages
DESCRIPTION = Disables messages from appearing when a user goes to forward a sms message and then abandons it only for it to appear when the user composes a new message.<br/><br/>WebOS saves this message as a draft that automatically appears when composing a new message. Abandoned reply messages within existing conversations threads will still appear.
CATEGORY = Messaging
VERSIONS = 1.4.5-1
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = opacityzero
HOMEPAGE = http://forums.precentral.net/webos-patches/239038-patch-disable-abandoned-forwards-new-messages-messaging-app.html
