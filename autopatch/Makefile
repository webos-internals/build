default:
	for f in `find ./ -mindepth 1 -maxdepth 1 -type d -print` ; do \
		${MAKE} -C $$f package || exit; \
	done

clobber:
	for f in `find ./ -mindepth 1 -maxdepth 1 -type d -print` ; do \
		${MAKE} -C $$f clobber; \
	done
