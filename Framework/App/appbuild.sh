#!/bin/sh

#delete
rm CONSUMERTASK
rm PRODUCERTASK
rm IDLETASK
rm NWMGRTASK
rm LOOPTASK
rm App

/home/LinuxBenchmarkAutomation/Cross-compiler/bin/arm-buildroot-linux-uclibcgnueabihf-gcc ConsumerTask.c -o AppBin/CONSUMERTASK
/home/LinuxBenchmarkAutomation/Cross-compiler/bin/arm-buildroot-linux-uclibcgnueabihf-gcc ProducerTask.c -o AppBin/PRODUCERTASK
/home/LinuxBenchmarkAutomation/Cross-compiler/bin/arm-buildroot-linux-uclibcgnueabihf-gcc IdleTask.c -o AppBin/IDLETASK
/home/LinuxBenchmarkAutomation/Cross-compiler/bin/arm-buildroot-linux-uclibcgnueabihf-gcc NwMgr.c -o AppBin/NWMGRTASK
/home/LinuxBenchmarkAutomation/Cross-compiler/bin/arm-buildroot-linux-uclibcgnueabihf-gcc InfiniteLoop.c -o AppBin/LOOPTASK
/home/LinuxBenchmarkAutomation/Cross-compiler/bin/arm-buildroot-linux-uclibcgnueabihf-gcc main.c -o AppBin/App


