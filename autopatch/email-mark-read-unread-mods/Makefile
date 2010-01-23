NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TITLE = Mark Read-Unread Mods
DESCRIPTION = This patch modifies how messages are marked as read or unread in the email application. This patch is designed and tested for webOS version 1.2.1 only.<br/><br/>This patch makes the following changes:<br/>1) Messages are NOT marked as read when they are opened from the message list card. Normally, this is what happens, which may not be useful if you just want to review a message but don't want to have it be marked as read.<br/><br/>2) The 'Mark as Read'/'Mark as Unread' menu item is properly coded to set the label based on the read/unread state of the message. Because of the default of marking a message as read when it is opened, the menu item was hard-coded to always display as 'Mark as Unread'. Per #1 above, if messages are not being marked as read when they are opened, this change is needed to ensure the menu renders correctly.<br/><br/>3) The message is marked as read when any of the following actions happen:<br/>a) message is forwarded<br/>b) message is replied to (regular reply or reply-all)<br/>c) message is deleted
CATEGORY = Email
VERSIONS = 1.2.1-27
ICON = http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

MAINTAINER = computrav <webospatches@safaricomputers.com>
HOMEPAGE =
