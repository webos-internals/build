NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = Five Minute Auto Redial
DESCRIPTION = Telcel has calling plans that allow unlimited 5 minute calls to predefined contacts. This patch identifies the predefined contact selected then hangs up at 4:45 minutes of a call made to him and redials automatically. Add 'NE ' as a prefix to the contact's name you wish to recognize. For example if the contact's name is 'Roberto Ibarra' rename it in the address<br/>book to 'NE Roberto Ibarra'. Call him and after 4:45 minutes the call will be dropped and redialed. You may change the duration only from the source code.    <br/>Tested on Webos: 1.3.5.1
CATEGORY = Phone
VERSIONS = 1.3.5-31 1.4.1-1
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Roberto Ibarra <ribarra@innox.com.mx>
HOMEPAGE =
