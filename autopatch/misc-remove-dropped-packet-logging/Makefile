NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TWEAKS =
TITLE = Remove Dropped Packet Logging
DESCRIPTION = Stop iptables from logging IPT_PACKET_DROPPED_NO_MATCH and needlessly clogging up /var/log/messages
CATEGORY = Misc
VERSIONS = 1.4.5-40 2.0.0-38 2.0.1-65 2.1.0-19 3.0.0-7 3.0.2-3
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = WebOS Internals
HOMEPAGE =