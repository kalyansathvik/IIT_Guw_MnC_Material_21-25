#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <syslog.h>
#include <signal.h>

void start_daemon()
{
	umask(0000);
	pid_t pid=fork();
	if(pid==0)
	{
		
		pid_t sid=setsid();
		if(sid < 0)
		{
	
		printf("sid failed");
		exit(1);
		}
		chdir("/");
		
		
		close(STDIN_FILENO);
		close(STDOUT_FILENO);
		close(STDERR_FILENO);
		
		openlog("mydaemon.log", LOG_PID | LOG_CONS, LOG_USER);
		
		syslog(LOG_INFO,"successfully created daemon");
		
		
		while(1)
		{
			pid_t pid=fork();
			if(pid!=0)
			{
				exit(1);
			}
			int i=getpid();
			syslog(LOG_INFO,"%d ",i);
			while(i>1)
			{
				if(i%2==0)
				{
					i=i/2;
					
				}
				else
				{
					i=3*i+1;
					
				}
				syslog(LOG_INFO,"%d ",i);
			}
			
			syslog(LOG_INFO,"\n");
			closelog();
			
			sleep(20);
			
			
		}
		
		
		
	}
}

void stop_daemon()
{
	const char *process_name = "run_daemon";

    
    char command[100];
    snprintf(command, sizeof(command), "pkill %s", process_name);
    
    int result = system(command);

    if (result == 0) {
        printf("Successfully killed process '%s'\n", process_name);
    } else {
        printf("Failed to kill process '%s'\n", process_name);
    }

    
}

int main(int argc,char* argv[])
{
	if(strcmp(argv[1],"start")==0)
	{
		start_daemon();
		//printf("%o",getpid());
	}
	
	if(strcmp(argv[1],"stop")==0)
	{
		stop_daemon();
	}
}
