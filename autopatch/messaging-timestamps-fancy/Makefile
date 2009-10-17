NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = Timestamps - Fancy
DESCRIPTION =  This will add timestamps to messages in the Messaging application. The format of the timestamps are MM/DD/YY 00:00 AM and are blue with spacing between them and the message.
CATEGORY = Messaging
WEBOS_VERSION = 1.2.1
IPKG_VERSION = 0
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [\"http://www.webos-internals.org/images/a/a1/Messaging-timestamps.png\"]
META_SUB_VERSION = 1
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna

include ../common.mk
include ../modifications.mk

MAINTAINER = jjvcuyler <jack@unixgeeks.biz>
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Messaging_Adding_Timestamps_to_All_Received_Messages
