NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = No vibrate or sound on messaging send
DESCRIPTION = Unless you have your sound preferences set to mute, the messaging app in 3.0 will vibrate and sound when both sending and receiving a message. This patch removes the vibrate and sound when SENDING, only
CATEGORY = Messaging
VERSIONS = 3.0.0-11 3.0.2-3
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Jason Robitaille, Audemars02
HOMEPAGE = http://forums.precentral.net/webos-patches/287882-patch-silence-sound-vibrate-send-touchpad-messaging-app.html