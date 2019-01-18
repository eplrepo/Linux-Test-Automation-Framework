#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>


int main()
{
        system("ping 192.168.0.2 -q");
        return(0);
}
