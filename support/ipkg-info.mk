build/ipkg-info-%: ${DOCTOR_DIR}/ipkg-info-%
	rm -rf build/ipkg-info-$*
	mkdir -p build/ipkg-info-$*
	if [ "`ls $</*.list`" != "" ]; then \
		cp $</*.list $@/; \
	fi

.PRECIOUS: ${DOCTOR_DIR}/ipkg-info-%
${DOCTOR_DIR}/ipkg-info-%: ${DOCTOR_DIR}/webosdoctor-%.jar
	if [ -e $< ]; then \
		unzip -p $< resources/webOS.tar | \
		tar --wildcards -O -x -f - './nova-cust-image-*.rootfs.tar.gz' | \
		tar -C ${DOCTOR_DIR} -m -z -x -f - ./usr/lib/ipkg/info; \
		mv ${DOCTOR_DIR}/usr/lib/ipkg/info ${DOCTOR_DIR}/ipkg-info-$*; \
		rm -rf ${DOCTOR_DIR}/usr; \
	fi
	mkdir -p $@

${DOCTOR_DIR}/webosdoctor-1.1.3.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100eww-wr-1.1.3.jar ] ; then \
	  ln -s webosdoctorp100eww-wr-1.1.3.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/p113r0d10122009/wr640xdfgy12z/webosdoctorp100eww-wr.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.2.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.2.1.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.2.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/p121r0d10092009/sr1ntp121rod/webosdoctorp100ewwsprint.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.3.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.3.1.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.3.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p131r0d11172009/sr1ntp131rod/webosdoctorp100ewwsprint.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.3.5.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.3.5.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.3.5.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p135r0d12302009/sr1ntp135rod/webosdoctorp100ewwsprint.jar ; \
	fi

${DOCTOR_DIR}/webosdoctor-1.4.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.4.0.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.4.0.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p14r0d02252010/sr1ntp140rod/webosdoctorp100ewwsprint.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-1.4.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ewwsprint-1.4.1.1.jar ] ; then \
	  ln -s webosdoctorp100ewwsprint-1.4.1.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p1411r0d03312010/sr1ntp1411rod/webosdoctorp100ewwsprint.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-1.4.2.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp101ewwatt-1.4.2.jar ] ; then \
	  ln -s webosdoctorp101ewwatt-1.4.2.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/preplus/p142r0d05162010/attp142rod/webosdoctorp101ewwatt.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-1.4.3.jar:
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pixiplus/px143r0d06062010/attp143rod/webosdoctorp121ewwatt.jar

${DOCTOR_DIR}/webosdoctor-1.4.5.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100eu-wr-1.4.5.jar ] ; then \
	  ln -s webosdoctorp100ueu-wr-1.4.5.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p145r0d06302010/eudep145rod/webosdoctorp100ueu-wr.jar; \
	fi

