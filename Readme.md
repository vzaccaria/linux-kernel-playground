> A simply reproducible Linux kernel playground. Checkout, compile and run the
> latest linux kernel with qemu

## Features

- To build the container: `make build`

- To open a terminal in the container: `make connect`

- In the container

  - run `/scripts/build-fs.sh` to build up the initial ram disk and then
    `start-qemu.sh` to launch the kernel

  - You can modify the kernel code and the rerun `/scripts/build-k.sh` to
    rebuild it

- To disconnect from qemu: CTRL-a x

## References

- https://www.collabora.com/news-and-blog/blog/2017/01/16/setting-up-qemu-kvm-for-kernel-development/
- https://github.com/gurugio/book_linuxkernel_blockdrv/blob/master/environment.md
- https://github.com/cirosantilli/linux-kernel-module-cheat#u-boot
