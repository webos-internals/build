.PHONY: jars
jars: ${JARFILES}

.PRECIOUS: ${JARFILES}
${JARFILES}: ${DL_DIR}/webosdoctorp100ewwsprint.jar
	rm -rf build/java
	unzip -p $< resources/webOS.tar | \
	tar -O -x -f - ./nova-cust-image-castle.rootfs.tar.gz | \
	tar -C build --strip-components=4 -m -z -x -f - ./usr/lib/luna/java
	touch $@

${DL_DIR}/webosdoctorp100ewwsprint.jar :
	mkdir -p ${DL_DIR}
	curl -L -o $@ http://palm.cdnetworks.net/rom/pre_p100eww/webosdoctorp100ewwsprint.jar
