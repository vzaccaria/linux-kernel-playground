qemu-system-x86_64 -smp 4 -kernel /sources/linux/arch/x86_64/boot/bzImage -initrd /staging/initramfs-busybox-x86.cpio.gz -nographic -append "console=ttyS0 init=/init" -nographic -vnc :0 -k en-us

