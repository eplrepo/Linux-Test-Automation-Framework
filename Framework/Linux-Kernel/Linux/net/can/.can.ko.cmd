cmd_net/can/can.ko := arm-buildroot-linux-uclibcgnueabihf-ld -EL -r  -T ./scripts/module-common.lds --build-id  -o net/can/can.ko net/can/can.o net/can/can.mod.o ;  true
