

FROM ubuntu:groovy

RUN echo "xyz"
RUN apt-get update
RUN apt-get install -y wget git qemu-system qemu-utils python3 python3-pip \
        gcc libelf-dev libssl-dev bc flex bison vim bzip2  cpio

RUN mkdir -p /staging
RUN mkdir -p /staging/initramfs/fs
WORKDIR /staging

# Download kernel
RUN git clone --depth=1 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
WORKDIR /staging/linux
RUN make x86_64_defconfig

# Add KVM guest support.  There exist a make KVM configuration target that
# tunes an existing configuration and makes it usable from QEMU. 
# RUN make kvm_guest.config

RUN make -j8 bzImage


# Download busybox
WORKDIR /staging
RUN wget https://busybox.net/downloads/busybox-1.32.1.tar.bz2
RUN tar xvjf busybox-1.32.1.tar.bz2
WORKDIR /staging/busybox-1.32.1
RUN make defconfig
RUN LDFLAGS="--static" make -j8 install

# Create initial file system (which will be loaded in memory by qemu)

WORKDIR /staging/initramfs/fs
RUN mkdir -pv bin sbin etc proc sys usr/bin usr/sbin 
RUN cp -av /staging/busybox-1.32.1/_install/* .
COPY init .
RUN find . -print0 | cpio --null -ov --format=newc | gzip -9 > /staging/initramfs-busybox-x86.cpio.gz
WORKDIR /staging
COPY start-qemu.sh .
EXPOSE 5900

