cmd_arch/arm/boot/dts/overlays/rpi-cirrus-wm5102.dtbo := mkdir -p arch/arm/boot/dts/overlays/ ; arm-buildroot-linux-uclibcgnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/overlays/.rpi-cirrus-wm5102.dtbo.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/overlays/.rpi-cirrus-wm5102.dtbo.dts.tmp arch/arm/boot/dts/overlays/rpi-cirrus-wm5102-overlay.dts ; ./scripts/dtc/dtc -@ -H epapr -O dtb -o arch/arm/boot/dts/overlays/rpi-cirrus-wm5102.dtbo -b 0 -i arch/arm/boot/dts/overlays/ -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/boot/dts/overlays/.rpi-cirrus-wm5102.dtbo.d.dtc.tmp arch/arm/boot/dts/overlays/.rpi-cirrus-wm5102.dtbo.dts.tmp ; cat arch/arm/boot/dts/overlays/.rpi-cirrus-wm5102.dtbo.d.pre.tmp arch/arm/boot/dts/overlays/.rpi-cirrus-wm5102.dtbo.d.dtc.tmp > arch/arm/boot/dts/overlays/.rpi-cirrus-wm5102.dtbo.d

source_arch/arm/boot/dts/overlays/rpi-cirrus-wm5102.dtbo := arch/arm/boot/dts/overlays/rpi-cirrus-wm5102-overlay.dts

deps_arch/arm/boot/dts/overlays/rpi-cirrus-wm5102.dtbo := \
  scripts/dtc/include-prefixes/dt-bindings/pinctrl/bcm2835.h \
  scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h \
  scripts/dtc/include-prefixes/dt-bindings/mfd/arizona.h \
    $(wildcard include/config/error.h) \

arch/arm/boot/dts/overlays/rpi-cirrus-wm5102.dtbo: $(deps_arch/arm/boot/dts/overlays/rpi-cirrus-wm5102.dtbo)

$(deps_arch/arm/boot/dts/overlays/rpi-cirrus-wm5102.dtbo):
