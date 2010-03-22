NAME     = palmprebackup
APP_ID   = com.tntservices.${NAME}
VERSION  = 1.0.1124
HOMEPAGE = http://www.webos-internals.org/wiki/Application:BackupUtility
MAINTAINER = TNT Services <Drewp9@yahoo.com>
TITLE   = Backup Utility (Highly Experimental)
DEPENDS = com.tntservices.ppbkuservice
TYPE	= Application
DESCRIPTION = <b><font color=red>THIS APPLICATION MAY DESTROY DATA ON YOUR PHONE. DO NOT USE IT UNLESS YOU ARE WILLING TO RISK LOSING ALL DATA ON YOUR PHONE, AND POSSIBLY THE DATA IN YOUR PALM PROFILE TOO.</font></b><br>This is the very first public alpha release.<br>Please test it on the emulator only, and report your experiences on the PreCentral thread.<br>An application to backup and restore vital Palm Pre data like Phone call logs, text conversations, browser history, bookmarks and cookies. It also backs up most applications and their individual settings.
CHANGELOG = 1.0.1124: Added file picker for restore.<br>1.0.1121: First public alpha test version.
CATEGORY = Experimental
ICON	= http://www.webos-internals.org/images/5/55/Archive.png
LICENSE  = GPL v2 Open Source
SCREENSHOTS = [\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture360-main-screen.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture365-restore-selection.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture366-restore-confirmation.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture367-resore-processing.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture368-restore-completion.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture361-backup-selection.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture362-backup-confirmation.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture363-backup-processing.jpg\",\
\"http://forums.precentral.net/members/drewpre-albums-my-first-app-picture364-backup-complete.jpg\" ]

SRC_GIT = git://git.webos-internals.org/applications/palmprebackup.git

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_all.ipk
include ../../support/package.mk

include ../../support/download.mk

build/.built-${VERSION} build/.unpack: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/all/usr/palm/applications/${APP_ID}
	tar -C build/all/usr/palm/applications/${APP_ID} -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build/all/usr/palm/applications/${APP_ID}/.git*
	touch $@

.PHONY: clobber
clobber::
	rm -rf build
