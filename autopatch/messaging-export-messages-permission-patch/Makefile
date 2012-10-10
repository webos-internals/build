NAME = $(shell basename $(shell pwd))
PATCH = messaging/${NAME}.patch
TWEAKS =
TITLE = Export Messages permission patch
DESCRIPTION = Grants the Export Messages app permission to read the message database so it can wirte all messages into a text file on the usb partition.
CATEGORY = Messaging
VERSIONS = 2.1.0-266 2.1.1-102 2.1.2-104 2.2.4-78 3.0.2-103 3.0.4-77 3.0.5-41
ICON = http://www.webos-internals.org/images/2/24/Icon_WebOSInternals_Patches_Messaging.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Garfonso
HOMEPAGE = http://webos.mobo.info