NAME = $(shell basename $(shell pwd))
PATCH = contacts/${NAME}.patch
TITLE = Send All Contacts via Email
DESCRIPTION = This patch allows you to create a vCard file containing all your contacts, and then attach that file to an e-mail. WebOS does not offer a built-in way to export your contacts, so this seems to be the next best thing.
CATEGORY = Contacts
VERSIONS = 1.3.1-28 1.3.5-11
ICON = http://www.webos-internals.org/images/c/ca/Icon_WebOSInternals_Patches_Contacts.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/5/52/Contacts-send-all-contacts-via-email-1.png\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = bsiegel <brandon@smartercode.net>
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Contacts_Send_All_via_Email