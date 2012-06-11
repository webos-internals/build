NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Remove Messaging beeps
DESCRIPTION = The Messaging app in webOS 3+ beeps for every new message received in a conversation, every time it redraws that conversation.  This is terribly annoying.  This patch removes that alert tone.
CATEGORY = Messaging
VERSIONS = 3.0.5-28
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = eblade <blade.eric@gmail.com>
HOMEPAGE =