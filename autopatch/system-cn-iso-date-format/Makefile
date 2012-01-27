NAME = $(shell basename $(shell pwd))
PATCH = system/${NAME}.patch
TWEAKS =
TITLE = CN ISO date format
DESCRIPTION = China and ISO date use the format in YY-MM-DD or YYYY-MM-DD.The en_cn locale come with WebOS (language=English and Format=China in region setting) is not ISO date. This patch make it so, just like en_dk you see in other linux
CATEGORY = System
VERSIONS = 2.1.0-210 2.1.1-22 2.1.2-31 2.2.0-100 2.2.3-93 2.2.4-4 3.0.2-76 3.0.4-40 3.0.5-4
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = moo <moo.tinys@gmail.com>
HOMEPAGE =