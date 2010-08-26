NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TITLE = Remove Dropped Packet Logging
DESCRIPTION = Stop iptables from logging IPT_PACKET_DROPPED_NO_MATCH and needlessly clogging up /var/log/messages
CATEGORY = Misc
VERSIONS = 1.4.1-52 1.4.2-38 1.4.3-32 1.4.5-40
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = WebOS Internals
HOMEPAGE =