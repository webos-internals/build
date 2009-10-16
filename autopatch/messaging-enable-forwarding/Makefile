NAME = $(shell basename $(shell pwd))
PATCH = /messaging/${NAME}.patch
TITLE = Enable Forwarding
DESCRIPTION = This will add the ability to forward messages in the Messaging application. Touch a message to use this feature.
CATEGORY = Messaging
WEBOS_VERSION = 1.2.1
IPKG_VERSION = 0
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/5/5c/Message-forwarding-1.png\",\
\"http://www.webos-internals.org/images/9/97/Message-forwarding-2.png\"]
META_SUB_VERSION = 1
#POSTINSTALLFLAGS = RestartLuna
#POSTREMOVEFLAGS = RestartLuna

include ../common.mk
include ../modifications.mk

MAINTAINER = jjvcuyler <jack@unixgeeks.biz>
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Messaging_Forward_Messages
