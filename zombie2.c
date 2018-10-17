#include <stdio.h>
#include <unistd.h>
#include <signal.h>

void reconocehijo (int signum)
{

	wait();
	signal (SIGCHLD, reconocehijo);
}

main ()
{
	char c;
	int rc;

	if (signal (SIGCHLD, reconocehijo)<0)
	{
		// error
		 exit (-1);
	}
	
	rc = fork ();

	if (rc <0)
	{
		// error
		exit (-1);
	} else if (rc == 0)
	{
		// soy el hijo, solo salgo
		exit (2);
	} 

	puts ("patata");
	

	while (read (0,&c,1) == 1);

}
