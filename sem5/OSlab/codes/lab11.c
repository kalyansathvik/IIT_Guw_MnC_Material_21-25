#include <stdio.h> 
#include <stdlib.h> 
#include <unistd.h> //Header file for sleep(). man 3 sleep for details. 
#include <pthread.h> 


int a[400][400];
int b[400][400];
int c[400][400];
pthread_mutex_t lock[400][400]; 

struct help
{
	int threadno;
};

void* funny(void* varg)
{
	struct help* h=(struct help*)varg;
	int k=h->threadno;
	
	printf("k: %d\n",k);
	printf("thread_id %ld\n",pthread_self());
	for(int i=0;i<400;i++)
	{
		for(int j=0;j<400;j++)
		{
			for(int i_=0;i_<100;i_++)
			{
					pthread_mutex_lock(&(lock[i][j]));
					c[i][j]+=a[i][100*k+i_]*b[100*k+i_][j];
					pthread_mutex_unlock(&(lock[i][j])); 
			}
		}
	}
}



int main(void)
{
	for(int i=0;i<400;i++)
	{
		for(int j=0;j<400;j++)
		{
			if (pthread_mutex_init(&(lock[i][j]), NULL) != 0) { 
				printf("\n mutex init has failed\n"); 
				return 1; 
			} 
		}
	}
	
	for(int i=0;i<400;i++)
	{
		for(int j=0;j<400;j++)
		{
			a[i][j]=i+1;
		}
	}
	
	for(int i=0;i<400;i++)
	{
		for(int j=0;j<400;j++)
		{
			b[i][j]=j+1;
		}
	}
	
	for(int i=0;i<400;i++)
	{
		for(int j=0;j<400;j++)
		{
			c[i][j]=0;
		}
	}
	
	
	pthread_t thread_id[4];
	struct help* h[4];
	struct help h1[4];
	for(int i=0;i<4;i++)
	{
		h1[i].threadno=i;
		h[i]=&(h1[i]);
		pthread_create(&(thread_id[i]), NULL,funny,h[i]); 
	}
	
	for(int i=0;i<4;i++)
	{
		
		pthread_join(thread_id[i], NULL); 
	}
	
	FILE* f1=fopen("output.txt","w");
	for(int i=0;i<400;i++)
	{
		for(int j=0;j<400;j++)
		{
			fprintf(f1,"%d ",c[i][j]);
		}
		fprintf(f1,"\n");
	}
	
	fclose(f1);
	
}
