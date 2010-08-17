NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = History Chat Balloon Color with Scrim
DESCRIPTION = Change messaging app history view to show conversation balloon to be green if last message is from phone owner (outgoing) and to blue for others (incoming)to match chat view. You need add chat-balloon-history-left.png to /media/internal/scrims/ for this patch to work. (MIT license)
CATEGORY = Messaging
VERSIONS = 1.4.0-69 1.4.1-42 1.4.2-28 1.4.3-22 1.4.5-28
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/8/89/Messaging-history-chat-balloon-color--with-scrim-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = blake0 <blake.zero@yahoo.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/241136-patch-messaging-history-chat-ballon-color.html