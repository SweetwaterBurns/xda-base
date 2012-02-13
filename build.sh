#!/bin/sh

#Sets variables for xda-dev base
export BASEDIR=`readlink -f $PWD`
export KERNELDIR=$BASEDIR/kernels/el29
export INITRAMFS_SOURCE=$BASEDIR/initramfs/initramfsroot
export DEFCONFIG=xda-dev
export CWMSOURCE=$BASEDIR/CWM-kernel
export TOOLCHAIN=2009q3-68
export JOBS=`grep 'processor' /proc/cpuinfo | wc -l`

#Command line options that allow overriding defaults, if desired.
#With the defconfig, you don't need to type the trailing "_defconfig" as it will be added automatically
#i.e. For the default options you could run "./build.sh el29 initramfsroot xda-dev 2009q3-68"
if [ "${1}" != "" ];then
  export KERNELDIR=$BASEDIR/kernels/${1}
fi

if [ "${2}" != "" ];then
  export INITRAMFS_SOURCE=$BASEDIR/initramfs/${2}
fi

if [ "${3}" != "" ];then
  export DEFCONFIG=${3}
fi

if [ "${4}" != "" ];then
  export TOOLCHAIN=${4}
fi

#Setup environment variables for the build
export INITRAMFS_TMP="$KERNELDIR/initramfs"

export CONFIG_DEFAULT_HOSTNAME=xda-dev
export ARCH=arm
export CROSS_COMPILE=$BASEDIR/toolchain/$TOOLCHAIN/bin/arm-none-eabi-

if [ ! -f $KERNELDIR/.config ];
then
  cd $KERNELDIR
  make "$DEFCONFIG"_defconfig
fi

. $KERNELDIR/.config

#Cleanup from any previous builds and copies clean initramfs and CWM-zip
rm -rf $INITRAMFS_TMP
mkdir $INITRAMFS_TMP
rm -rf $INITRAMFS_TMP
cp -ax $INITRAMFS_SOURCE $INITRAMFS_TMP
find $INITRAMFS_TMP -name .git -exec rm -rf {} \;
rm -rf $INITRAMFS_TMP/.hg
rm -rf $KERNELDIR/CWM-kernel
cp -ax $CWMSOURCE $KERNELDIR/CWM-kernel

#Now we get to the actual work. This will automaticly detect the number of cores and build with the appropriate number of jobs.
echo compiling modules...
cd $KERNELDIR/
make -j$JOBS || exit 1

#Find all compiled modules and copy them for the final build
find -name '*.ko' -exec cp -av {} $INITRAMFS_TMP/lib/modules/ \;

#Final build with initramfs
echo compiling kernel...
make -j$JOBS zImage CONFIG_INITRAMFS_SOURCE="$INITRAMFS_TMP" || exit 1

#Creates a ClockworkMod flashable zip with the defconfig, date and time for versioning info.
echo creating CWM flashable zip
cp $KERNELDIR/arch/arm/boot/zImage  $KERNELDIR/CWM-kernel/
cd $KERNELDIR/CWM-kernel/
zip -r -9 $BASEDIR/$DEFCONFIG-kernel-`date +%Y.%m.%e-%H.%M`.zip .
