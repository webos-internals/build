NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = GSM iDialPlan Pre Dialer Integration
DESCRIPTION = Integrates iDialPLan into the Pre standard dialer. v0.9: First number after a boot dials OK now; disable/enable by dialing 0000x now; 1.4.5 OK. Patch 0.9 requires iDialPLan 0.9.x. An enabled iDP takes over so called normalization of the std. dialer. Setting a dialplan for the patch can be done in the App only.
CATEGORY = Phone
VERSIONS = 1.4.5-8
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Itura
HOMEPAGE = http://forums.precentral.net/homebrew-apps/226937-idialplan-automatic-number-adjustment-international-calling-travelers.html#post2178249
