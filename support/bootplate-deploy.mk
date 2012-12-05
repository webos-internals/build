build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/src
	mkdir -p build/src-predeploy
	tar -C build/src-predeploy -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	cd build/src-predeploy && node enyo/tools/deploy.js
	cp -r build/src-predeploy/deploy/src-predeploy/. build/src
	rm -rf build/src/bin build/src/*.script
	touch $@
