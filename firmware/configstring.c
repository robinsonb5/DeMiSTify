#include "config.h"
#include "spi.h"
#include "configstring.h"

unsigned char configstring_coretype;
// #define configstring_next() SPI(0xff)

__weak unsigned char configstring_index=0;

__weak int configstring_next()
{
	return(SPI(0xff));
}

__weak void configstring_begin()
{
	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	configstring_coretype=SPI(SPI_CONF_READ); /* Read conf string command */
}


__weak void configstring_end()
{
	SPI_DISABLE(HW_SPI_CONF);
}


__weak int configstring_nextfield()
{
	int c;
	do
		c=configstring_next();
	while(c && c!=';');
	return(c);
}

/* Copy a maximum of limit bytes to the output string, stopping when a comma is reached. */
/* If the copy flag is zero, don't copy, just consume bytes from the input */

__weak int configstring_copytocomma(char *buf, int limit,int copy)
{
	int count=0;
	int c;
	c=configstring_next();
	while(c && c!=',' && c!=';')
	{
		if(count<limit && copy)
			*buf++=c;
		if(c)
			++count;
		c=configstring_next();
	}
	if(copy)
		*buf++=0;
	return(c==',' ? count : -count);
}


__weak int configstring_getdigit()
{
	unsigned int c=configstring_next();
//	printf("Getdigit %c\n",c);
	if(c>='0' && c<='9')
		c-='0';
	if(c>='A' && c<='Z')
		c-='A'-10;
	return(c);	
}


__weak int configstring_matchextension(const char *ext)
{
	int done=0;
	unsigned int i=0;
	int c=1;
	int c1,c2,c3;

#ifdef CONFIG_SETTINGS
	if(configstring_index==CONFIGSTRING_INDEX_CFG)
	{
		if(ext[8]=='C' && ext[9]=='F' && ext[10]=='G')
			return(1);
		return(0);
	}

#endif

	configstring_begin();

/*  The first config entry has the corename, a semicolon, then optional match extensions.
    Subsequent configs have a type, a comma, then the extensions.
    We can find the correct entry by stepping over semicolons.  */

//	putchar('0'+configstring_index);

//	printf("Config index %d\n",configstring_index);

	for(i=0;i<=configstring_index;++i)
		configstring_nextfield();

/*	Having found the correct entry, we need to step over the descriptor if there is one. */

	if(configstring_index) /* No descriptor for the first entry. */
	{
		do
		{
			c=configstring_next();
//			putchar(c);
		} while(c && c!=',');
	}

	i=0;
//	putchar('\n');
	while(!done)
	{
		c1=configstring_next();
		c2=configstring_next();
		c3=configstring_next();
//		printf("%d, %d, %d, %d, %d, %d\n",c1,c2,c3,ext[8],ext[9],ext[10]);
		++i;
		if(c1==ext[8] && c2==ext[9] && c3==ext[10])
			done=1;
		else if(c1==',' || c1==';')
		{
			i=0;
			done=1;
		}
	}
	configstring_end();
//	printf("Second match result %d\n",i);
	return(i);
}


