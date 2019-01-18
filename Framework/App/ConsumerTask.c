#include <stdio.h> 
#include <sys/ipc.h> 
#include <sys/msg.h> 
  
// structure for message queue 
struct mesg_buffer { 
    long mesg_type; 
    char mesg_text[100]; 
} message; 
  
int main()
//void ConsumerTask() 
{ 
    key_t key; 
    int msgid; 

	int num_of_bytes = 0;
  
    // ftok to generate unique key 
    key = ftok("progfile", 65); 
  
    // msgget creates a message queue 
    // and returns identifier 
    msgid = msgget(key, 0666 | IPC_CREAT); 
  
    while(1)
    {

//    	printf("[CONSUMER TASK] : Waiting For Msg...\n");
    	// msgrcv to receive message 
    	num_of_bytes = msgrcv(msgid, &message, sizeof(message), 1, 0); 

    	if(num_of_bytes > 0)
  	{
		// display the message 
 //   		printf("[CONSUMER TASK] : %s recvd\n",message.mesg_text);

	}
    }
  
    return 0; 
} 

