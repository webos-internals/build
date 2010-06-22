NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TITLE = Suppress Javascript Error
DESCRIPTION = Fixes bug in _updateAccountsInfo() method in Email application that causes error when email app is loaded.  This method and error seem to add no functionality to the email app so this 'bug fix' is really just to get rid of an error reported to stdout.  No functionality should be changed.
CATEGORY = Email
VERSIONS = 1.3.5-3 1.4.0-3 1.4.1-1 1.4.2-1 1.4.3-1 1.4.5-1
ICON = http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
SCREENSHOTS = 
META_SUB_VERSION = 1

include ../common.mk
include ../modifications.mk

MAINTAINER = Eric J Gaudet <emoney_33@yahoo.com>
