NAME     = daliclock
APP_ID   = org.jwz.${NAME}
VERSION  = 2.29.0
HOMEPAGE = http://www.jwz.org/xdaliclock/
DESCRIPTION = Dali Clock is a digital clock. When a digit changes, it morphs into its new shape.
TYPE	 = Application
CATEGORY = Clocks and Timers
ICON	 = http://www.webos-internals.org/images/1/18/Daliclock.png

SRC_IPKG = http://www.jwz.org/xdaliclock/${NAME}-229.ipk

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/application-copy.mk
