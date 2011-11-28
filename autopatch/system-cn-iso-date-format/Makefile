NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
TWEAKS =
TITLE = CN ISO date format
DESCRIPTION = China and ISO date use the format in YY-MM-DD or YYYY-MM-DD.The en_cn locale come with WebOS (language=English and Format=China in region setting) is not ISO date. This patch make it so, just like en_dk you see in other linux
CATEGORY = System
VERSIONS = 2.1.0-210
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = moo <moo.tinys@gmail.com>
HOMEPAGE =