NAME     = tipcalculator
TITLE	 = Tip Calculator
APP_ID   = org.jwz.${NAME}
VERSION  = 1.0.6
HOMEPAGE = http://www.jwz.org/${NAME}/
TYPE	 = Application
CATEGORY = Finance
ICON	 = http://www.webos-internals.org/images/7/75/Tip_Calculator.png
DESCRIPTION = A simple restaurant tip calculator.  By default, it only does whole numbers, because if you insist that your tip be accurate to the penny you are a cheapskate weirdo. Here in the Colonies, we use paper money, not coins. If your bill is \$$44.22, just enter \$$45. Don\'t go all Scrooge McAsperger\'s on us, ok? But, there is a \"scrooge mode\" that lets you calculate your tips so that no penny is left behind, if is how you roll.

SRC_IPKG = http://www.jwz.org/${NAME}/${APP_ID}_${VERSION}_${PLATFORM}.ipk

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

include ../../support/application-copy.mk
