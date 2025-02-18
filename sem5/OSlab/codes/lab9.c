#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <unistd.h>
#include <sys/wait.h>
#define MAX_SIZE 100

union semun {
	int val;              /* used for SETVAL only */
	struct semid_ds *buf; /* for IPC_STAT and IPC_SET */
	ushort *array;        /* used for GETALL and SETALL */
};

void sem_wait(int semid)
{
    // (*sb)={0,-1,0};
    struct sembuf hi;
    struct sembuf* sb=&hi;
    
    (*sb).sem_num=0;
    (*sb).sem_op=-1;
    (*sb).sem_flg=0;

    if (semop(semid, sb, 1) == -1)
    {
    perror("semop");
    exit(1);
    }



}

void sem_signal(int semid)
{
	struct sembuf hi;
    struct sembuf* sb=&hi;
    // *sb ={0,1,0};
    
    (*sb).sem_num=0;
    (*sb).sem_op=1;
    (*sb).sem_flg=0;

    if (semop(semid,sb, 1) == -1) 
    {
    perror("semop");
    exit(1);
    }
}

typedef struct
{
	char name[50];
	int pid[10];
} dtab;

int main(void)
{
	dtab tables[5];
	key_t key1[5];
	key_t key2[5];
	int semid[5];
	int shmid[5];
	union semun arg;
	
	//printf("hi1\n");
	for(int i=69;i<74;i++)
	{
		
		key1[i-69]=ftok("lab9.c",i);
	
		if ((semid[i-69] = semget(key1[i-69], 1, 0666|IPC_CREAT)) == -1) {
		    perror("semget");
		    exit(1);
		}
		
		 arg.val = 1;
		if (semctl(semid[i-69], 0, SETVAL, arg) == -1) {
		    perror("semctl");
		    exit(1);
		}

    }
    
    char* ch[5];
    //printf("hi2\n");
    for(int i=74;i<79;i++)
    {
    	key2[i-74]=ftok("lab9.c",i);
    	
    	if ((shmid[i-74] = shmget(key2[i-74], 100, 0666 | IPC_CREAT)) == -1) {
			perror("shmget");
			exit(1);
		}
		
		ch[i-74]=shmat(shmid[i-74],(void *)0,0);
		if (ch[i-74] == (char *)(-1))
			perror("shmat");
	}
	
	/*
	tables[0].name="table 0";
	tables[1].name="table 1";
	tables[2].name="table 2";
	tables[3].name="table 3";
	tables[4].name="table 4";
	*/
	
	//printf("hi3\n");
	char temp[255];
	pid_t pid[5];
	for(int i=0;i<5;i++)
	{
		//printf("create\n");
		pid[i]=fork();
		if(pid[i]==0)
		{
			exit(1);
		}
	}
	sleep(2);
	//printf("hi4\n");
	for(int i=0;i<5;i++)
	{
		//printf("%d\n",pid[i]);
	}
	
	//printf("hi10\n");
	
	//printf("hi11\n");
	for(int round=0;round<5;round++)
	{
		//printf("hi %d\n",round);
		for(int y=0;y<5;y++)
		{
			//printf("hello %d\n",round);
			sem_wait(semid[(round+y)%5]);
			sem_wait(semid[(round+y+1)%5]);
			//printf("%d\n",y);
			printf("Transaction %d operating on Table %d-Table %d\n",getpid()+(round+y+1)%5,(round+y)%5,(round+y+1)%5);
			sprintf(temp,"Transaction %d holding the semaphore\n",getpid()+(round+y+1)%5);
			strcat(ch[(round+y)%5],temp);
			strcat(ch[(round+y+1)%5],temp);
			sem_signal(semid[(round+y)%5]);
			sem_signal(semid[(round+y+1)%5]);
		}
		printf("\n");
		sleep(10);
	}
	
	for(int i=0;i<5;i++)
	{
		printf("For semaphore %d:\n",i);
		printf("%s\n",ch[i]);
	}
	
	
	
}

