NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Timestamps Clean
DESCRIPTION = This will add timestamps to messages in the Messaging application. The format of the timestamps are MM/DD/YY 00:00 AM and are black with no spacing between them and the message.
CATEGORY = Messaging
VERSIONS = 2.1.0-2 2.2.0-17 2.2.3-17
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/8/88/Clean-timestamp.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = acydlord, dBsooner, CRaiaSoftware
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Messaging_Adding_Timestamps_to_All_Received_Messages