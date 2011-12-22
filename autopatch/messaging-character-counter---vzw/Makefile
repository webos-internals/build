NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Character Counter - VZW
DESCRIPTION = This patch is only for those using a VZW 2.0.1 build base, that is, those on a CDMA Pre 2. Those of you who are running a 2.1.0 on a Pre -/+ using a meta-doctor script or are using a GSM Pre 2 should use the unmarked Character Counter patch. <br/><br/>This will add a small dot in the top left corner of the text entry field in the Messaging application. It will keep track of how many characters have been entered. When nothing has been entered, the dot will not be visible.
CATEGORY = Messaging
VERSIONS = 2.0.0-57 2.0.1-87 2.1.0-125
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [ \"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = malpha <dropdeadbabies@gmail.com>, HattCzech
HOMEPAGE = http://forums.precentral.net/webos-patches/221456-patch-messaging-character-counter.html
