NAME = $(shell basename $(shell pwd))
PATCH = browser/${NAME}.patch
TWEAKS =
TITLE = Remove shared URL text from emails
DESCRIPTION = This is a simple patch that will remove the default subject and text when sharing a URL.Currently, whenever you share a url from within the web browser it automatically fills in the subject for you as: 'Check out this web page...'It also automatically fills in the body with 'Here's a website I think you'll like: 'This patch simply removes the subject so that its blank and in the body of the message it has a link to the website, with no extra text, moved three lines down.This allows you to easily fill in your own subject and to start typing in the body without having to move anything around.
CATEGORY = Browser
VERSIONS = 2.1.0-210 2.1.1-22 2.1.2-31 2.2.4-59
ICON = http://www.webos-internals.org/images/4/4a/Icon_WebOSInternals_Patches_Browser.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = intron
HOMEPAGE = http://forums.precentral.net/webos-patches/307192-patch-remove-subject-body-text-emails-when-sharing-url.html