#include <stdio.h>
#include <unistd.h>


main ()
{
	char c;
	

	int rc = fork ();

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
