
#include <stdint.h>
#include <limits.h>
#include <sys/syscall.h>
#include <linux/futex.h>

#include <sys/ioctl.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <time.h>
#include <string.h>

#include "test.h"
#include "safe_macros.h"

#include <linux/i2c-dev.h>

/* I2C COMMANDS */

/* Test Data to I2C */

/* I2C Registers Specific to Temperature Sensor(Sense HAT) */

#define READ_BUFF 	0x2F
#define CTRL_REG1 	0x20
#define CTRL_REG2 	0x21
#define TEMP_OUT_L 	0x2A
#define TEMP_OUT_H 	0x2B
#define CNTL_REG4	0x1E
#define CNTL_REG5	0x1F
#define WHO_AM_I	0x0F

char *TCID = "I2C_test01";

int i2c_fd = -1;

static char *i2c_dev ;
static char slave_addr;
static char tst_flag;


static const option_t options[] = {
        {"d:", NULL, &i2c_dev},
        {NULL, NULL, NULL}
};

static void help(void)
{
        printf("  -d x    device node, default is %s\n",i2c_dev);
}

void delay(int t)
{
    usleep(t * 1000);
}

void test_init(void)
{
        tst_require_root();

        if (access(i2c_dev, F_OK) == -1)
                tst_brkm(TCONF, NULL, "couldn't find i2c device ", i2c_dev);

        i2c_fd = SAFE_OPEN(NULL,i2c_dev,O_RDWR);
 
        if(i2c_fd < 0 && errno != ENOENT)
        {
                tst_brkm(TBROK | TERRNO, NULL,"open(%s)", i2c_dev);
        }
	else
	        tst_resm(TPASS, "I2C Slave Found!!!!!");

	if (SAFE_IOCTL(NULL,i2c_fd, I2C_SLAVE, slave_addr) < 0) {
    		 tst_brkm(TCONF, NULL, "Failed to acquire bus access and/or talk to slave.\n");
	}
}

void test_cleanup(void)
{

       if(i2c_fd > 0 && close(i2c_fd))
		tst_resm(TWARN | TERRNO,"close(i2c_fd)");
   
       //SAFE_CLOSE(NULL,i2c_fd);
       //SAFE_CLOSE(i2c_fd);
       close(i2c_fd);
       tst_resm(TINFO, "I2C Tests Done!");
}


int main(int argc, char *argv[])
{
        
      tst_parse_opts(argc, argv, options, help);
     
      i2c_dev 	 = argv[1];
      slave_addr = strtol(argv[2],NULL,16);	

      test_init();

      printf("* =================================== *\n\n");
 
      test_cleanup(); 
      
      tst_exit();
}
