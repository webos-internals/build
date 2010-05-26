NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TITLE = SMS Tone per Contact v2
DESCRIPTION = This is a reworked version of the original SMS Tone Per Contact patch.<br/><br/>Summary of changes to the original patch:<br/><br/>- Since the unpatched messaging application now allows for selecting a global message tone, removed the redundant code that added this functionality.<br/><br/>- Contacts are now looked up by phone number and then email address, rather than just phone number, in case the sms was sent via email.<br/>- Slight interface cleanup ('Pick a message tone' now in same font and style as 'Pick a ringtone')<br/>- Removed selection of default notification and alert sounds.  Following the Unix law, this patch does one thing well.
CATEGORY = Messaging
VERSIONS = 1.4.0-45 1.4.1-16 1.4.2-2
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS = [\
\"http://www.webos-internals.org/images/1/10/Messaging-sms-tone-per-contact-v2-1.png\",\
\"http://www.webos-internals.org/images/a/ab/Messaging-sms-tone-per-contact-v2-2.png\",\
\"http://www.webos-internals.org/images/f/fe/Messaging-sms-tone-per-contact-v2-3.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = JackieRipper <jack@unixgeeks.biz>
HOMEPAGE = http://forums.precentral.net/webos-patches/246118-patch-sms-tone-per-contact-v2.html