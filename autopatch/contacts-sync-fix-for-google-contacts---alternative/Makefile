NAME = $(shell basename $(shell pwd))
PATCH = contacts/${NAME}.patch
TWEAKS =
TITLE = Sync Fix for Google Contacts - Alternative
DESCRIPTION = This patch is an alternative version to fix sync issue for google contacts. Issues fixed: * Upload contacts with non-ASCII characters like Chinese * Upload contacts for field with only space character. Issues not fixed yet: * Some non-ASCII character corrupted randomly. When this happen, every bytes of the UTF-8 character is recognized as a character
CATEGORY = Contacts
VERSIONS = 2.2.0-76 2.2.3-70 3.0.2-70 3.0.4-33
ICON = http://www.webos-internals.org/images/c/ca/Icon_WebOSInternals_Patches_Contacts.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = moo <moo.tinys@gmail.com>
HOMEPAGE =