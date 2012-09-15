NAME = $(shell basename $(shell pwd))
PATCH = email/${NAME}.patch
TWEAKS =
TITLE = Fix Re for replies in French email app
DESCRIPTION = This patch changes the French 'Re :' (reply) to 'Re:'.It is especially helpful if your recipients have problems with threading in certain mail apps. It will also fix 'Re : Re:' chains in the subject line.
CATEGORY = Email
VERSIONS = 2.2.4-72
ICON = http://www.webos-internals.org/images/2/29/Icon_WebOSInternals_Patches_Email.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Alexis Toyane <alexistoyane@gmail.com>
HOMEPAGE =