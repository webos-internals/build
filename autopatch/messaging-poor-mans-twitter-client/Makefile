NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = Poor Mans Twitter Client
DESCRIPTION = If you receive messages from Twitter via SMS and frequently use the Messaging app to reply to and/or retweet them, you may be interested in this patch.<br/><br/>It adds 'Retweet', 'Reply', and 'Leave' items to the context menu that shows up when you click on a message. None of these commands send your message right away; this allows you to check and edit the message before sending it.<br/><br/>For this patch to work, your contact *must* be named 'Twitter' (case-insensitive). Should also work with shortcode 40404.
CATEGORY = Messaging
VERSIONS = 1.3.5-14
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/5/5a/Messaging-poor-mans-twitter-client-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = dsevil <dse@webonastick.com>
HOMEPAGE = http://webonastick.com/webos/patches/