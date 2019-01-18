#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>

#define MAX_SEND_SIZE	80

struct mymsgbuf {
        long mtype;
        char mtext[MAX_SEND_SIZE];
};

int main()
{
        key_t key;
        int   msgqueue_id;
        struct mymsgbuf qbuf;

	int num_of_bytes = 0;

        /* Create unique key via call to ftok() */
        key = ftok(".", 'm');

        /* Open the queue - create if necessary */
        if((msgqueue_id = msgget(key, IPC_CREAT|0660)) == -1) {
                perror("msgget");
                exit(1);
        }
        
	while(1)
	{
		/* Read a message from the queue */
        	printf("[IDLE TASK] : Waiting for message ...\n");
        	num_of_bytes = msgrcv(msgqueue_id, qbuf.mtext, MAX_SEND_SIZE, qbuf.mtype, 0);

		if(num_of_bytes > 0)
		{
		   printf("[IDLE TASK] : Message Rcvd is %s\n",qbuf.mtext);
		}
	}
        
        return(0);
}
