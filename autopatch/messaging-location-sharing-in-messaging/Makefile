NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Location Sharing In Messaging
DESCRIPTION = Basically, this patch will auto-detect GPS coordinates within IMs and SMS/MMS. Coordinates in the form ,.Detected coordinates in messages will turn into tappable links. Tapping on a coordinate link will open that location Google Maps.In addition, I've added an option in the chat-view's app menu: 'Insert GPS Location'. As you'd expect, it basically inserts your current location (as gps coordinates) into the chat text box. I've also binded the command to metatap+l (metatap with a lowercase L).This kind of quick location communication could be very handy. For example, you could sent a text message to a friend asking where they are. Then they'd just need to send their coordinates and you can find them quickly, on-the-go.
CATEGORY = Messaging
VERSIONS = 2.1.0-142 2.1.1-22 2.1.2-31 2.2.0-21 2.2.3-21 2.2.4-14
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE =