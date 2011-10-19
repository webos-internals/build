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

${DOCTOR_DIR}/webosdoctor-1.4.5.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp100ueu-wr-1.4.5.jar ] ; then \
	  ln -s webosdoctorp100ueu-wr-1.4.5.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre/p145r0d06302010/eudep145rod/webosdoctorp100ueu-wr.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-1.4.5.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp101ewwverizonwireless-1.4.5.1.jar ] ; then \
	  ln -s webosdoctorp101ewwverizonwireless-1.4.5.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/preplus/p1451r0d05182011/ver1z0np1451rod/webosdoctorp101ewwverizonwireless.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.0.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp103ueu-wr-2.0.0.jar ] ; then \
	  ln -s webosdoctorp103ueu-wr-2.0.0.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre2/p20r0d11182010/wrep20rod/webosdoctorp103ueu-wr.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.0.1.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp102ueuna-wr-2.0.1.jar ] ; then \
	  ln -s webosdoctorp102ueuna-wr-2.0.1.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/pre2/p201r0d11242010/wrep201rod/webosdoctorp102ueuna-wr.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.1.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp101ueude-wr-2.1.0.jar ] ; then \
	  ln -s webosdoctorp101ueude-wr-2.1.0.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/preplus/p210r0d02212011/eudep210rod/webosdoctorp101ueude-wr.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.1.2.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp160unaatt-2.1.2.jar ] ; then \
	  ln -s webosdoctorp160unaatt-2.1.2.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/veer/p212r0d05132011/attp212rod/webosdoctorp160unaatt.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.2.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp220manta-wr-2.2.0.jar ] ; then \
	  ln -s webosdoctorp220manta-wr-2.2.0.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/manta/p220r0d08222011/wdmantarow/webosdoctorp220mantawr.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-2.2.3.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp223mantaatt-2.2.3.jar ] ; then \
	  ln -s webosdoctorp223mantaatt-2.2.3.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/manta/p223r0d09272011/wdmantaatt/webosdoctorp223mantaatt.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-3.0.0.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp300hstnhwifi-3.0.0.jar ] ; then \
	  ln -s webosdoctorp300hstnhwifi-3.0.0.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/touchpad/wd300wifi/webosdoctorp300hstnhwifi.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-3.0.2.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp302hstnhwifi-3.0.2.jar ] ; then \
	  ln -s webosdoctorp302hstnhwifi-3.0.2.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/touchpad/p302r0d08012011/wifip302rod/webosdoctorp302hstnhwifi.jar; \
	fi

${DOCTOR_DIR}/webosdoctor-3.0.4.jar:
	mkdir -p ${DOCTOR_DIR}
	if [ -e ${DOCTOR_DIR}/webosdoctorp304hstnhwifi-3.0.4.jar ] ; then \
	  ln -s webosdoctorp304hstnhwifi-3.0.4.jar $@ ; \
	else \
	  curl -L -o $@ http://palm.cdnetworks.net/rom/touchpad/p304rod10182011/wd304wifi/webosdoctorp304hstnhwifi.jar; \
	fi
