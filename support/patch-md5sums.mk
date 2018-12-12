.PHONY: md5sums
md5sums: build/md5sums

.PRECIOUS: build/md5sums
build/md5sums: ${DOCTOR_DIR}/webosdoctorp100ewwsprint.jar
	rm -rf build/md5sums
	mkdir -p build
	unzip -p $< resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
	tar -C build -m -z -x -f - ./md5sums
	touch $@

${DOCTOR_DIR}/webosdoctorp100ewwsprint.jar :
	mkdir -p ${DOCTOR_DIR}
	#curl -L -o $@ http://downloads.help.palm.com/rom/pre_p100eww/webosdoctorp100ewwsprint.jar
	curl -L --header 'Host: palm.cdnetworks.net' -o $@ http://195.22.200.42/webosdoctor/rom/pre/p14r0d02252010/sr1ntp140rod/webosdoctorp100ewwsprint.jar
