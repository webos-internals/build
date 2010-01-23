NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TITLE = Delete From Notification
DESCRIPTION = This patch lets you delete the email displayed in the notification bar. Once deleted the sync should send an update to your Pre to either remove the notification or update the notification with the next new email.<br/><br/>Changelog:<br/>11-23-09: Handle deletes better - now clear stage after every delete. Fix single-email-template for line that was to long aparently.
CATEGORY = Email
VERSIONS = 1.2.1-26 1.3.1-27 1.3.5-8
ICON = http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
SCREENSHOTS = [\"http://www.webos-internals.org/images/b/b4/Email-delete-from-notification-1.jpg\"]
META_SUB_VERSION = 3

include ../common.mk
include ../modifications.mk

MAINTAINER = lclarkjr <lclarkjr@gmail.com>
HOMEPAGE = http://forums.precentral.net/showthread.php?p=2041533#post2041533
