#include  <stdio.h>
#include  <string.h>
#include  <sys/types.h>
typedef enum
{
        START_PID=0,
        PRODUCERTASK_ID,
        CONSUMERTASK_ID,
        IDLETASKID,
	NWMGRTASK,
	LOOPTASK
}logicalPid_e;

void Create_Process(logicalPid_e id_e);


int main()
{
	printf("Starting Application Framework.....\n");
	Create_Process(PRODUCERTASK_ID);
	Create_Process(CONSUMERTASK_ID);
	Create_Process(IDLETASKID);
	Create_Process(NWMGRTASK);
	Create_Process(LOOPTASK);
}


void Create_Process(logicalPid_e id_e)
{
	int 	pid = 0;
	switch(id_e)
	{
		case PRODUCERTASK_ID:
			pid = fork();
			if(pid == 0)
			{
				execv("./PRODUCERTASK",NULL);
			}
			break;
		case CONSUMERTASK_ID:
			pid = fork();
                        if(pid == 0)
                        {
				execv("./CONSUMERTASK",NULL);
                        }
                        break;
		case IDLETASKID:
			pid = fork();
                        if(pid == 0)
                        {
                                execv("./IDLETASK",NULL);
                        }

                        break;

		case NWMGRTASK:
                        pid = fork();
                        if(pid == 0)
                        {
                                execv("./NWMGRTASK",NULL);
                        }

                        break;

		case LOOPTASK:
			pid = fork();
                        if(pid == 0)
                        {
                                execv("./LOOPTASK",NULL);
                        }

                        break;
			break;

		default:
			break;
	}
}
