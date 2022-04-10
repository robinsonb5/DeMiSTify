#include "statusword.h"
#include "spi.h"
#include "user_io.h"

unsigned int statusword; /* Support 32-bit status word initially - need to be 64-bit in the long run */

__weak void sendstatus()
{
	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	SPI(UIO_SET_STATUS2);
	SPI(statusword);
	SPI(statusword>>8);
	SPI(statusword>>16);
	SPI(statusword>>24);
	SPI_DISABLE(HW_SPI_CONF);
}

