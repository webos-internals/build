NAME = $(shell basename $(shell pwd))
PATCH = browser/${NAME}.patch
TWEAKS =
TITLE = More transparent share link
DESCRIPTION = Changes the email generated when sharing a link from the Browser. Emailsubject is the page title and the body of the email is populated with thepage title and the URL separated by a line break. No hyperlink or canned text. Works great with my WebOS 3 email patch: 'Include Plain Text Alternate'
CATEGORY = Browser
VERSIONS = 2.2.4-75 3.0.5-39
ICON = http://www.webos-internals.org/images/4/4a/Icon_WebOSInternals_Patches_Browser.png
SCREENSHOTS = [ \"http://www.webos-internals.org\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = bbito
HOMEPAGE = http://forums.webosnation.com/webos-patches/318860-patch-more-transparent-share-link.html