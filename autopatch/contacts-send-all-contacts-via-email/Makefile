NAME = $(shell basename $(shell pwd))
PATCH = contacts/${NAME}.patch
TWEAKS =
TITLE = Send All Contacts via Email
DESCRIPTION = This patch allows you to create a vCard file containing all your contacts, and then attach that file to an e-mail. WebOS does not offer a built-in way to export your contacts, so this seems to be the next best thing.
CATEGORY = Contacts
VERSIONS = 2.1.0-159 2.2.0-19 2.2.3-19
ICON = http://www.webos-internals.org/images/c/ca/Icon_WebOSInternals_Patches_Contacts.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = bsiegel, Dick99999
HOMEPAGE = http://www.webos-internals.org/wiki/Patch_Contacts_Send_All_via_Email