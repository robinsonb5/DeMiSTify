
#include "spi.h"


void spi_write(const char *data,int len)
{
	do {
		SPI(*data++);
	} while(--len);	
}


void spi_read(char *data,int len)
{
	int k=0xff;
	do {
		*data++=SPI(k);
	} while(--len);
}

