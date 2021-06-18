
%.x: %.c
	gcc $< -o $@

%.elf: %.x
	readelf -h $<

%.s: %.c
	gcc -S $< -s 
