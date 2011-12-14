NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = History Chat Balloon Color with Scrim v2
DESCRIPTION = Change messaging app history view to show conversation balloon to be green if last message is from phone owner (outgoing) and to blue for others (incoming)to match chat view. Also change new messages balloon color. You need add chat-balloon-history-left.png and chat-balloon-left-new.png to /media/internal/.scrims/ for this patch to work. (MIT license)
CATEGORY = Messaging
VERSIONS = 1.4.5-129 2.0.0-40 2.0.1-67 2.1.0-30 2.1.1-22 2.1.2-31
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/6/60/Messaging-history-chat-balloon-color-with-scrim-v2-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = blake0 <blake.zero@yahoo.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/241136-patch-messaging-history-chat-ballon-color.html
