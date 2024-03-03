
#include "spi.h"


void spi_write(const char *data,int len)
{
	int l=len;
	do {
		SPI(*data++);
	} while(--l);	
}


void spi_read(char *data,int len)
{
	int l=len;
	do {
		*data++=SPI(0xff);
	} while(--l);
}

