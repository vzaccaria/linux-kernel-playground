cmd_/demos/modules/hello.ko := ld -r -m elf_x86_64 --build-id=sha1  -T scripts/module.lds -o /demos/modules/hello.ko /demos/modules/hello.o /demos/modules/hello.mod.o;  true
