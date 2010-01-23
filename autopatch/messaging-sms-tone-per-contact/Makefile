NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = SMS Tone per Contact
DESCRIPTION = This patch adds a message tone field to all of your contacts.  Once this field is set, it will play that tone when any SMS message comes in from that contact.  If the contact doesn't have a message tone set, it will go to the global default message tone set in Sounds and Alerts.  If there is not a global default set, it will simply play the alert.  This patch also adds the ability to set the alert tone and notifications tone from the Sounds & Alerts application.<br /><br /> Changelog:<br />11-21-2009: Fix the issue where no notification was played if you were in a chat window
CATEGORY = Messaging
VERSIONS = 1.2.1-1 1.3.1-17 1.3.5-11 1.4.0-2
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/a/a5/Sms-tone-per-contact-1.png\",\
\"http://www.webos-internals.org/images/e/e4/Sms-tone-per-contact-2.png\"]
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

MAINTAINER = Ikyo <jody.r.owens@sprint.com>, Elryon, dBsooner 
HOMEPAGE = http://forums.precentral.net/webos-patches/215183-updated-sms-tone-per-contact-1-3-1-a.html
