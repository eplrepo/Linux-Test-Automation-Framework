cmd_crypto/xor.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o crypto/xor.ko crypto/xor.o crypto/xor.mod.o ;  true
