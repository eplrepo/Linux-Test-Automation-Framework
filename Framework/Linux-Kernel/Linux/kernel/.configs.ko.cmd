cmd_kernel/configs.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o kernel/configs.ko kernel/configs.o kernel/configs.mod.o ;  true
