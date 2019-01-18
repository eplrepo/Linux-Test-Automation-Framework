
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

#define I2C_READ 	0x00
#define I2C_WRITE	0x01

/* Test Data to I2C */

#define TEST_DATA 	0xA5

/* I2C Registers Specific to Temperature Sensor(Sense HAT) */

#define READ_BUFF 	0x2F
#define CTRL_REG1 	0x20
#define CTRL_REG2 	0x21
#define TEMP_OUT_L 	0x2A
#define TEMP_OUT_H 	0x2B
#define CNTL_REG4	0x1E
#define CNTL_REG5	0x1F
#define WHO_AM_I	0x0F

char *TCID = "sensor_test01";

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

static void sensor_test(void)
{
	uint8_t temp_out_l = 0;
	uint8_t temp_out_h = 0;
	int16_t temp_out = 0;
	uint8_t tempRdBuf[2] = {0};
	uint8_t tempWrBuf[2] = {0};
	uint8_t status = 0;

	double t_c = 0.0;
 	
	tempWrBuf[0] = CTRL_REG1;
	tempWrBuf[1] = 0x00;
	write(i2c_fd,tempWrBuf,2);
	
	tempWrBuf[0] = CTRL_REG1;
	tempWrBuf[1] = 0x84;
	write(i2c_fd,tempWrBuf,2);
	
	tempWrBuf[0] = CTRL_REG2;
	tempWrBuf[1] = 0x01;
	write(i2c_fd,tempWrBuf,2);
	
//	do {
		delay(25);
		tempRdBuf[0] = CTRL_REG2;
		status = read(i2c_fd,tempRdBuf,1);
//	}
//	while(status !=0);
	tempRdBuf[0] = TEMP_OUT_L;
	read(i2c_fd,tempRdBuf,1);
	
	temp_out_l = tempRdBuf[0];

	tempRdBuf[0] = TEMP_OUT_H;
	read(i2c_fd,tempRdBuf,1);
	
	temp_out_h = tempRdBuf[0];

	temp_out = temp_out_h << 8 | temp_out_l;

    	/* calculate output values */
	t_c = 42.5 + (temp_out / 480.0);

	printf("Temperature = %.2f°C\n", t_c);
	
	tempWrBuf[0] = CTRL_REG1;
        tempWrBuf[1] = 0x00;
        write(i2c_fd,tempWrBuf,2);
}

static void i2c_rw_test(int cmd)
{
	uint8_t rdBufReg = 0x2F;
	uint8_t rdCntlReg = 0x0F;
		
	uint8_t wrBuf[2]={0};
	uint8_t rdBuf[2]={0};
	uint8_t rdCntl;

		
	if(cmd == 0x01)
	{
        	wrBuf[0] = 0x3a;
		wrBuf[1] = TEST_DATA;
	        if(tst_flag) {       
			if(write(i2c_fd,wrBuf,2) != 2){
				printf("Failed to write to I2C\n");
			}
		        #if 0 
			if(read(i2c_fd,rdBuf,1) != 1){
				printf("Failed to read from I2C\n");
			}
			#endif
			else{
			#if 0
				if(rdBuf[0] != TEST_DATA){
					printf("value of reg 2e %x\n",rdBuf[0]);
					tst_resm(TFAIL, "I2C WRITE TEST Failed");
				}
				else{
					
			#endif
				tst_resm(TPASS, "I2C WRITE TEST Passed");
			//	}
			}
		}
		tst_resm(TFAIL, "I2C WRITE TEST Failed");
	}
	
	if(cmd == 0x00)
	{
		wrBuf[0] = WHO_AM_I;
	
		if(write(i2c_fd,wrBuf,1) != 1){
			tst_resm(TFAIL, "I2C WRITE TEST Failed");
		}
	
		if(read(i2c_fd,rdBuf,1) != 1){
			tst_resm(TFAIL,"I2C READ TEST Failed");
		}
                else{
			printf("Contents of WHO AM I Register %x\n",rdBuf[0]);
	        	tst_resm(TPASS, "I2C READ TEST Passed");
			tst_flag = 1;			
		}
	}	
	
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
	        tst_resm(TPASS, "I2C DRIVER OPEN TEST Passed");

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

      printf("* ========== LTP READ TEST ========== *\n");
      
      i2c_rw_test(I2C_READ);
      
      printf("* =================================== *\n\n");

      printf("* ========== LTP WRITE TEST ========= *\n");      
      
      i2c_rw_test(I2C_WRITE);

      printf("* =================================== *\n\n");
      
      printf("* ======== SENSOR TEST OUTPUT ======= *\n");

      if(tst_flag){
      	sensor_test();
      }
      else
	tst_resm(TFAIL,"SENSOR TEST Failed");
	
      printf("* =================================== *\n\n");
 
      test_cleanup(); 
      
      tst_exit();
}
