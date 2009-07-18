package:
	mkdir -p build
	find apps mods plugins -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % package
	find apps mods plugins -type d -name build -print | \
	xargs -I % find % -name "*.ipk" -print | \
	xargs -I % rsync -i -a % build/

clobber:
	rm -rf build
	find apps mods plugins -type d -depth 1 -print | \
	xargs -I % ${MAKE} -C % clobber

clean:
	find . -name "*~" -delete