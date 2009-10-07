NAME = $(shell basename ${PWD})
PATCH = /messaging/${NAME}.patch
TITLE = SMS Tone per Contact
DESCRIPTION = This patch adds a message tone field to all of your contacts.  Once this field is set, it will play that tone when any SMS message comes in from that contact.  If the contact doesn't have a message tone set, it will go to the global default message tone set in Sounds and Alerts.  If there is not a global default set, it will simply play the alert.  This patch also adds the ability to set the alert tone and notifications tone from the Sounds & Alerts application.
CATEGORY = Messaging
VERSION = 0.5.0
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = 

include ../common.mk
include ../modifications.mk
