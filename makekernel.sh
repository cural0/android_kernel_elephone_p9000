#!/bin/bash
DEFCONFIG=DarkSense_defconfig
KERNEL=DarkSense
if [  -f $KERNEL ]; then
	rm $KERNEL
fi
if [  -f $DEFCONFIG ]; then
	rm $DEFCONFIG
fi
make clean && make mrproper
export CROSS_COMPILE=~/android/android-ndk-r12b/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-
export ARCH=arm64
make -j12 $DEFCONFIG
make -j12
cp arch/arm64/boot/Image.gz-dtb $KERNEL
