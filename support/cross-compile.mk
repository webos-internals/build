ifeq ($(shell uname -s),Darwin)
CROSS_COMPILE_armv7 = /opt/PalmPDK/arm-gcc/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_armv6 = /opt/PalmPDK/arm-gcc/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_arm   = /opt/PalmPDK/arm-gcc/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_i686  = /opt/PalmPDK/i686-gcc/bin/i686-nptl-linux-gnu-
TOOLCHAIN_DIR_armv7 = /opt/PalmPDK/arm-gcc/bin
TOOLCHAIN_DIR_armv6 = /opt/PalmPDK/arm-gcc/bin
TOOLCHAIN_DIR_arm   = /opt/PalmPDK/arm-gcc/bin
# TOOLCHAIN_DIR_i686  = /opt/PalmPDK/i686-gcc/bin
# CFLAGS_i686  = "--sysroot=/opt/PalmPDK/i686-gcc/sys-root -O2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers"
TOOLCHAIN_DIR_i686  = $(error "Unable to build for i686 on MacOSX")
build/i686.built-${VERSION}:
	@true
build/i686.staged-${VERSION}:
	@true
ipkgs/${APP_ID}_${VERSION}_i686.ipk:
	@echo "Unable to build for i686 on MacOSX"
else
CROSS_COMPILE_armv7 = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_armv6 = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_arm   = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_i686  = $(shell cd ../.. ; pwd)/toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-
TOOLCHAIN_DIR_armv7 = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin
TOOLCHAIN_DIR_armv6 = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin
TOOLCHAIN_DIR_arm   = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin
TOOLCHAIN_DIR_i686  = $(shell cd ../.. ; pwd)/toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/bin
endif

STAGING_DIR_armv7 = $(shell cd ../.. ; pwd)/staging/armv7
STAGING_DIR_armv6 = $(shell cd ../.. ; pwd)/staging/armv6
STAGING_DIR_arm   = $(shell cd ../.. ; pwd)/staging/armv7
STAGING_DIR_i686  = $(shell cd ../.. ; pwd)/staging/i686

CONFIGURE_HOST_armv7 = arm-none-linux-gnueabi
CONFIGURE_HOST_armv6 = arm-none-linux-gnueabi
CONFIGURE_HOST_arm   = arm-none-linux-gnueabi
CONFIGURE_HOST_i686  = i686-unknown-linux-gnu

CFLAGS_armv7 = "-O2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers"
CFLAGS_armv6 = "-O2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers"
CFLAGS_arm   = "-O2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers"
CFLAGS_i686  = "-O2 -fexpensive-optimizations -fomit-frame-pointer -frename-registers"
