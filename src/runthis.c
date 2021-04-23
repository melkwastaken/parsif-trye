#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <stdio.h>
#include <stdlib.h>


int main()
{
	pid_t pid1, pid2;

	printf("Sunt procesul (1,1), avand PID-ul: %d, parintele are PID-ul: %d\n",
                 getpid(), getppid());	

	for(int i=1; i<=2; i++)
	{
		if(-1 == (pid1=fork()) )
		{
			perror("Eroare la fork");
		}

		if(pid1 == 0)	
		{
			printf("Sunt procesul (2,%d), avand PID-ul: %d, parintele are PID-ul: %d\n",
                        i, getpid(), getppid());
			
			for(int j=1; j<=3; j++)
			{
				if(-1 == (pid2=fork()) )
				{
					perror("Eroare la fork");
				}
				if(pid2 == 0)	
				{
					printf("Sunt procesul (3,%d), avand PID-ul: %d, parintele are PID-ul: %d\n",
				                i*j, getpid(), getppid());
					return j;
				}	
			}
			return i;
		}	
		
	}
	
	return 0;
}
