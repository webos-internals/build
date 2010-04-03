NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = No Network Time Zone Error
DESCRIPTION = Under some circumstances, even with 'network time' and 'network time zone' disabled, you will still get an error at reboot about the network time zone being invalid. This patch gets rid of that error message.
CATEGORY = Misc
VERSIONS = 1.3.5-23
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Jason Robitaille
HOMEPAGE = http://forums.precentral.net/webos-patches/217338-patch-no-network-time-zone-error.html
