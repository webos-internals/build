NAME = $(shell basename $(shell pwd))
PATCH = contacts/${NAME}.patch
TWEAKS =
TITLE = Sort Contacts by PinYin
DESCRIPTION = Sort contact list with Chinese character translated into PinYin. non-chinese is not affected and still sorted as it was. PinYin framework patch is required for this patch to work.After installation, restart your device. Open contacts -> preferences, switch to sort by 'First Name', and then 'Last Name'
CATEGORY = Contacts
VERSIONS = 2.1.0-213 2.2.0-88 2.2.3-82 3.0.2-79 3.0.4-43
ICON = http://www.webos-internals.org/images/c/ca/Icon_WebOSInternals_Patches_Contacts.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = moo <moo.tinys@gmail.com>
HOMEPAGE = http://www.treo8.com/bbs/thread-275013-1-1.html