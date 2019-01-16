cmd_lib/xxhash.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o lib/xxhash.ko lib/xxhash.o lib/xxhash.mod.o ;  true
