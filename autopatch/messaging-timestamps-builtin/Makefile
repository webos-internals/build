NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = Timestamps Builtin
DESCRIPTION = This will cause the Messaging application use the builtin timestamps for all messages instead of just messages that show up late.
CATEGORY = Messaging
VERSIONS = 1.3.5-5 1.4.0-25 1.4.1-1 1.4.2-1 1.4.5-1
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [ \"http://www.webos-internals.org/wiki/Image:Timestamp-all-messages-builtin-method.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = jjvcuyler <jack@unixgeeks.biz>
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Messaging_Adding_Timestamps_to_All_Received_Messages
