cmd_mm/zsmalloc.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o mm/zsmalloc.ko mm/zsmalloc.o mm/zsmalloc.mod.o ;  true
