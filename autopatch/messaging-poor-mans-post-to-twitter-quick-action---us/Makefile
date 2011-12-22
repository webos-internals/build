NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = Poor Mans Post To Twitter Quick Action - US
DESCRIPTION = This patch modifies the default Quick Action for the Messaging app to prefill your contact as Twitter (40404). It changes the Quick Action to read 'Post to Twitter' instead of 'New Message'.<br/><br/>THIS PATCH REQUIRES YOUR TWITTER SHORTCODE TO BE 40404.<br/><br/>If your Twitter shortcode is not 40404, please see the Patch homepage to get a custom version for you.<br/><br/>(This removes the non-prefilled Quick Action; however, you can erase the pre-filled number whenever you want.)
CATEGORY = Messaging
VERSIONS = 2.1.0-17 2.1.1-22 2.1.2-31
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/9/9f/Messaging-poor-mans-post-to-twitter-quick-action---us-1.png\",\
\"http://www.webos-internals.org/images/7/74/Messaging-poor-mans-post-to-twitter-quick-action---us-2.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = malpha <dropdeadbabies@gmail.com>
HOMEPAGE = http://forums.precentral.net/webos-patches/277909-patch-poor-mans-post-twitter-quickaction-2-1-a.html
