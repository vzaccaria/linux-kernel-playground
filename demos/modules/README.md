
# Simple "hello world" module

Connect to the AOS container, then:

``` bash
cd /demos/modules
make prepare
make all               # to build the module in `hello.c`
make copy-to-fs        # prepare the module to be used for the next `build-fs.sh`
/scripts/build-fs.sh   # build the file system
/scripts/start-qemu.sh # run the kernel
```

Once in the QEMU env:
```
insmod modules/hello.ko # to load the hello world module
rmmod hello             # to remove the hello world module
```



