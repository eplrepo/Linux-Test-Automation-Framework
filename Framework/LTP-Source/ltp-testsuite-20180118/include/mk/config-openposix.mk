# Parameters from the top level configure
CC=		/home/epl/Jan_7/Linux-Test-Framework/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-gcc
CFLAGS+=	-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -Os -I/home/epl/Jan_7/Linux-Test-Framework/output/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/tirpc  
LDLIBS+=	 -L/home/epl/Jan_7/Linux-Test-Framework/output/host/bin/../arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -ltirpc  
LDFLAGS+=	
