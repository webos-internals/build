NAME = $(shell basename $(shell pwd))
PATCH = phone/${NAME}.patch
TITLE = GPS Diagnostic Additional information
DESCRIPTION = The default ##GPS# does not give very much information if the response is too slow, inaccurate, or receives an error.  This changes it to display the GPS coordinate results, even if the results are considered too inaccurate (a message is displayed warning you of this scenario).  Additionally, all 8 potential error responses are properly caught instead of giving a generic error.<br/><br/>This patch is useful to see exactly what is happening with your GPS, and see why it is or is not functioning the way you expect.
CATEGORY = Phone
VERSIONS = 1.4.5-1
ICON = http://www.webos-internals.org/images/2/2c/Icon_WebOSInternals_Patches_Phone.png
SCREENSHOTS = [ \"http://www.webos-internals.org/images/d/da/Phone-gps-diagnostic-additional-information-1.jpg\" ]
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = Ebag333 <ebagola@gmail.com>
HOMEPAGE =
