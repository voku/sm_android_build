# Configuration for Linux on ARM.
# Generating binaries for the ARMv5TE architecture and higher
#
ARCH_ARM_HAVE_THUMB_SUPPORT     := true
ARCH_ARM_HAVE_FAST_INTERWORKING := true
ARCH_ARM_HAVE_64BIT_DATA        := true
ARCH_ARM_HAVE_HALFWORD_MULTIPLY := true
ARCH_ARM_HAVE_CLZ               := true
ARCH_ARM_HAVE_FFS               := true
ARCH_ARM_HAVE_VFP               := true

ifeq ($(strip $(TARGET_ARCH_VARIANT_FPU)),)
TARGET_ARCH_VARIANT_FPU         := vfp
endif
ifeq ($(strip $(TARGET_ARCH_VARIANT_CPU)),)
TARGET_ARCH_VARIANT_CPU         := arm1176zjf-s
endif

# Note: Hard coding the 'tune' value here is probably not ideal,
# and a better solution should be found in the future.
#
arch_variant_cflags := \
                        -O3 \
                        -pipe \
                        -marm \
                        -march=armv6zk \
                        -mtune=arm1176jzf-s \
                        -mfpu=vfp \
    			-funsafe-loop-optimizations \
    			-funroll-loops \
                        -mfloat-abi=softfp \
                        -fomit-frame-pointer \
                        -D__ARM_ARCH_5__ \
                        -D__ARM_ARCH_5T__ \
                        -D__ARM_ARCH_5E__ \
                        -D__ARM_ARCH_5TE__

#arch_variant_cflags +=   \
                        -ffast-math \
                        -floop-interchange \
                        -floop-strip-mine \
                        -floop-block \
