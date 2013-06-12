NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Enable Line Breaks In SMS
DESCRIPTION = By default, webOS strips out all line breaks in text messages and replaces them with just a space.This patch allows SMS messages with line breaks to be properly displayed in the Messaging app
CATEGORY = Messaging
VERSIONS = 1.4.5-212 2.2.4-95
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/6/65/Messaging-enable-line-breaks-in-sms-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Thomas Coe <thomascoe1@gmail.com>
HOMEPAGE = http://forums.webosnation.com/webos-patches/325109-patch-update-enable-line-breaks-sms.html