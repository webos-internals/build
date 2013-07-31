NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Export Messages permission patch
DESCRIPTION = Grants the Export Messages app permission to read the message database so it can wirte all messages into a text file on the usb partition.
CATEGORY = Messaging
VERSIONS = 2.1.0-266 2.1.1-119 2.1.2-119 2.2.4-96 3.0.2-107 3.0.4-81 3.0.5-55
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Garfonso
HOMEPAGE = http://webos.mobo.info