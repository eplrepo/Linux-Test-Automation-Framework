# Parameters from the top level configure
CC=		/home/LinuxBenchmarkAutomation/Cross-compiler/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
CFLAGS+=	-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -I/home/LinuxBenchmarkAutomation/Cross-compiler/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/tirpc  
LDLIBS+=	 -L/home/LinuxBenchmarkAutomation/Cross-compiler/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -ltirpc  
LDFLAGS+=	
