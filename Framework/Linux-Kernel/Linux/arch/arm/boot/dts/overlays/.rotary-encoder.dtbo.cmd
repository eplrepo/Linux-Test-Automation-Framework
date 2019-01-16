cmd_arch/arm/boot/dts/overlays/rotary-encoder.dtbo := mkdir -p arch/arm/boot/dts/overlays/ ; arm-buildroot-linux-uclibcgnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/overlays/.rotary-encoder.dtbo.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/overlays/.rotary-encoder.dtbo.dts.tmp arch/arm/boot/dts/overlays/rotary-encoder-overlay.dts ; ./scripts/dtc/dtc -@ -H epapr -O dtb -o arch/arm/boot/dts/overlays/rotary-encoder.dtbo -b 0 -i arch/arm/boot/dts/overlays/ -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/boot/dts/overlays/.rotary-encoder.dtbo.d.dtc.tmp arch/arm/boot/dts/overlays/.rotary-encoder.dtbo.dts.tmp ; cat arch/arm/boot/dts/overlays/.rotary-encoder.dtbo.d.pre.tmp arch/arm/boot/dts/overlays/.rotary-encoder.dtbo.d.dtc.tmp > arch/arm/boot/dts/overlays/.rotary-encoder.dtbo.d

source_arch/arm/boot/dts/overlays/rotary-encoder.dtbo := arch/arm/boot/dts/overlays/rotary-encoder-overlay.dts

deps_arch/arm/boot/dts/overlays/rotary-encoder.dtbo := \

arch/arm/boot/dts/overlays/rotary-encoder.dtbo: $(deps_arch/arm/boot/dts/overlays/rotary-encoder.dtbo)

$(deps_arch/arm/boot/dts/overlays/rotary-encoder.dtbo):
