cmd_crypto/crypto_simd.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o crypto/crypto_simd.ko crypto/crypto_simd.o crypto/crypto_simd.mod.o ;  true
