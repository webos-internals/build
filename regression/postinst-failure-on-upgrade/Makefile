NAME     = postinst-failure-on-upgrade
TITLE	 = Post-Install Script Failure On Upgrade
APP_ID   = org.webosinternals.regression.${NAME}
SIGNER   = org.webosinternals
VERSIONS  = 1.0.0 2.0.0
DESCRIPTION = Regression test for a post-install script failure on upgrade.
TYPE	 = Service
CATEGORY = Regression Tests
FEED     = Regression Tests

.PHONY: package
ifneq ("${VERSIONS}", "")
package:
	for v in ${VERSIONS} ; do \
	  ${MAKE} VERSIONS= VERSION=$${v} package ; \
	done
else
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
endif
include ../../support/package.mk

build/.built-${VERSION}:
	rm -rf build/all
	mkdir -p build/all
ifeq ("${VERSION}","2.0.0")
	sed -e 's/%RETVAL%/1/' build/all/CONTROL/

	touch $@

build/all/CONTROL/postinst:
ifeq ("${VERSION}","2.0.0")
	sed -e 's/%RETVAL%/1/' control/postinst > $@
else
	sed -e 's/%RETVAL%/0/' control/postinst > $@
fi

clobber::
	rm -rf build
