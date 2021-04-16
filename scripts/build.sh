#!/bin/sh
# build linux

mkdir -p /staging/initramfs/fs

cd /sources/linux
make x86_64_defconfig
make -j4 bzImage


# build busybox
cd /sources/busybox-1.32.1
make defconfig
LDFLAGS="--static" make -j4 install

# Create initial file system (which will be loaded in memory by qemu)

cd /staging/initramfs/fs
mkdir -pv bin sbin etc proc sys usr/bin usr/sbin
cp -av /sources/busybox-1.32.1/_install/* .
cp /sources/init .
find . -print0 | cpio --null -ov --format=newc | gzip -9 > /staging/initramfs-busybox-x86.cpio.gz
cd /staging
