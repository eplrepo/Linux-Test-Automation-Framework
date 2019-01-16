cmd_drivers/hid/uhid.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o drivers/hid/uhid.ko drivers/hid/uhid.o drivers/hid/uhid.mod.o ;  true
