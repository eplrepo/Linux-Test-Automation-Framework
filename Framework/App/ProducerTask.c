
#include <stdio.h> 
#include <sys/ipc.h> 
#include <sys/msg.h> 
#include <string.h>
#include <stdlib.h>
  
// structure for message queue 
struct mesg_buffer { 
    long mesg_type; 
    char mesg_text[100]; 
} message; 
  
int main()
//void ProducerProcess()
{ 
    key_t key; 
    int msgid; 

    char data[32];
    char *buff = "Message";
    int i = 1;
  
    // ftok to generate unique key 
    key = ftok("progfile", 65); 
  
    // msgget creates a message queue 
    // and returns identifier 
    msgid = msgget(key, 0666 | IPC_CREAT); 
    message.mesg_type = 1; 

    while(1)
    {

	sprintf(message.mesg_text,"%s %d",buff,i);
  
    	// msgsnd to send message 
    	if(0 == msgsnd(msgid, &message, sizeof(message), 0))
    	{
//		printf("[PRODUCER TASK] : %s sent...\n",message.mesg_text);
    	}else
    	{
//		printf("[PRODUCER TASK] : Msg Send Failure...\n");
		exit(-1);
    	}
  
	i++;
//	sleep(1);
    }

     //return 0; 
} 

