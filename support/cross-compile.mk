CROSS_COMPILE_armv7 = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_armv6 = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_arm   = $(shell cd ../.. ; pwd)/toolchain/cs07q3armel/build/arm-2007q3/bin/arm-none-linux-gnueabi-
CROSS_COMPILE_i686  = $(shell cd ../.. ; pwd)/toolchain/i686-unknown-linux-gnu/build/i686-unknown-linux-gnu/bin/i686-unknown-linux-gnu-

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
