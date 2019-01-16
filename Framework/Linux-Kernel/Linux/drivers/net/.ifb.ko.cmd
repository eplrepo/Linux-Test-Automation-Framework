cmd_drivers/net/ifb.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/net/ifb.ko drivers/net/ifb.o drivers/net/ifb.mod.o ;  true
