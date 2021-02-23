#include <stdio.h>
#include "spi.h"

int sd_is_sdhc;
int sd_size;

// #define SPI_WAIT(x) while(HW_PER(PER_SPI_CS)&(1<<PER_SPI_BUSY));
// #define SPI(x) {while((HW_PER(PER_SPI_CS)&(1<<PER_SPI_BUSY))); HW_PER(PER_SPI)=(x);}
// #define SPI_READ(x) (HW_PER(PER_SPI)&255)

// #define SPI_CS(x) {while((HW_SPI(HW_SPI_CS)&(1<<HW_SPI_BUSY))); HW_SPI(HW_SPI_CS)=(x);}

#define cmd_reset(x) cmd_write(0x950040,0) // Use SPI mode
#define cmd_init(x) cmd_write(0xff0041,0)
#define cmd_read(x) cmd_write(0xff0051,x)
#define cmd_writesector(x) cmd_write(0xff0058,x)
#define cmd_CMD8(x) cmd_write(0x870048,0x1AA)
#define cmd_CMD9(x) cmd_write(0xff0049,0)
#define cmd_CMD16(x) cmd_write(0xFF0050,x)
#define cmd_CMD41(x) cmd_write(0x870069,0x40000000)
#define cmd_CMD55(x) cmd_write(0xff0077,0)
#define cmd_CMD58(x) cmd_write(0xff007A,0)

#undef SPI_DEBUG

#ifdef SPI_DEBUG
#define DBG(x) puts(x)
#define PDBG(x,y) printf(x,y)
#else
#define DBG(x)
#define PDBG(x,y)
#endif

unsigned char SPI_R1[6];

int SPI_PUMP()
{
	int r,r2;
	SPI(0xFF);
	r=SPI_READ();
	SPI(0xFF);
	r2=SPI_READ();
	r=(r<<8)|r2;
	SPI(0xFF);
	r2=SPI_READ();
	r=(r<<8)|r2;
	SPI(0xFF);
	r2=SPI_READ();
	r=(r<<8)|r2;
	return(r);
}


int SPI_PUMP_LE()
{
	int r,r2;
	SPI(0xFF);
	r=SPI_READ();
	SPI(0xFF);
	r2=SPI_READ()<<8;
	r|=r2;
	SPI(0xFF);
	r2=SPI_READ()<<16;
	r|=r2;
	SPI(0xFF);
	r2=SPI_READ()<<24;
	r|=r2;
	return(r);
}


int cmd_write(unsigned long cmd, unsigned long lba)
{
	int ctr;
	int result=0xff;

	PDBG("SD CMD %x ",cmd&255);

	SPI(cmd & 255);

	if(!sd_is_sdhc)	// If normal SD then we have to use byte offset rather than LBA offset.
		lba<<=9;

	PDBG("LBA %x, ",lba);

	SPI((lba>>24)&255);
	SPI((lba>>16)&255);
	SPI((lba>>8)&255);
	SPI(lba&255);

	PDBG("'CRC' %x  -> ",(cmd>>16)&255);

	SPI((cmd>>16)&255); // CRC, if any

	ctr=40000;

	result=SPI_READ();
	while(--ctr && (result==0xff))
	{
		SPI(0xff);
		result=SPI_READ();
	}
	PDBG("%x\n",result);

	return(result);
}


void spi_spin()
{
//	puts("SPIspin\n");
	int i;
	for(i=0;i<200;++i)
		SPI(0xff);
//	puts("Done\n");
}


int wait_initV2()
{
	int i=20000;
	int r;
	spi_spin();
	while(--i)
	{
		if((r=cmd_CMD55())==1)
		{
			SPI(0xff);
			if((r=cmd_CMD41())==0)
			{
				SPI(0xff);
				return(1);
			}
			spi_spin();
		}
		else
		{
			PDBG("CMD55 %d\n",r);
		}
	}
	return(0);
}


int wait_init()
{
	int i=20;
	int r;
	SPI(0xff);
	puts("CMD");
	while(--i)
	{
		if((r=cmd_init())==0)
		{
//			printf("init %d\n  ",r);
			SPI(0xff);
			return(1);
		}
		else
		{
			PDBG("init %d\n  ",r);
		}
		spi_spin();
	}
	return(0);
}


int is_sdhc()
{
	int i,r;

	spi_spin();

	r=cmd_CMD8();		// test for SDHC capability
	printf("cmd_CMD8 response: %d\n",r);
	if(r!=1)
	{
		PDBG("CMD8_4 response: %d\n",r);
		wait_init();
		DBG("CMD8 -> Not a V2 card\n");
		return(0);
	}

	r=SPI_PUMP();
	if((r&0xffff)!=0x01aa)
	{
		PDBG("CMD8_4 response: %d\n",r);
		wait_init();
		DBG("Not a V2 card\n");
		return(0);
	}

	SPI(0xff);

	DBG("V2 card - is it SHDC?  ");

	// If we get this far we have a V2 card, which may or may not be SDHC...

	i=50;
	while(--i)
	{
		if(wait_initV2())
		{
			if((r=cmd_CMD58())==0)
			{
				printf("CMD58 %d\n  ",r);
				SPI(0xff);
				r=SPI_READ();
				printf("CMD58_2 %d\n  ",r);
				SPI(0xff);
				SPI(0xff);
				SPI(0xff);
				SPI(0xff);
				if(r&0x40)
				{
					DBG("Yes\n");
					return(1);
				}
				else
				{
					DBG("No\n");
					return(0);
				}
			}
			else
				printf("CMD58 %d\n  ",r);
		}
		if(i==2)
		{
			printf("SDHC Initialization error!\n");
			return(0);
		}
	}
	return(0);
}


int spi_init()
{
	int i;
	int r;
	sd_is_sdhc=1;
	puts("SPI");
	i=8;
	while(--i)
	{
		SPI_DISABLE(HW_SPI_SD);	// Disable CS
		spi_spin();
		DBG("Activating CS\n");
		SPI_ENABLE(HW_SPI_SD);
		if(cmd_reset()==1) // Enable SPI mode
			i=1;
		DBG("Sent reset command\n");
		if(i==2)
		{
			puts("IERR");
			DBG("SD card initialization error!\n");
			return(0);
		}
	}
	DBG("Card responded to reset\n");
	sd_is_sdhc=is_sdhc();
	if(sd_is_sdhc)
		DBG("SDHC card detected\n");
	else // If not SDHC, Set blocksize to 512 bytes
	{
		DBG("Sending cmd16 (blocksize)\n");
		cmd_CMD16(1);
	}
	SPI(0xFF);

	sd_size=sd_get_size();
	printf("SD card size is %d\n",sd_size);


	SPI_DISABLE(HW_SPI_SD);
	SPI(0xFF);
	DBG("Init done\n");

	return(1);
}


int sd_write_sector(unsigned long lba,unsigned char *buf) // FIXME - Stub
{
    int i,t,timeout;

	SPI(0xff);
	SPI_ENABLE_FAST(HW_SPI_SD);
	SPI(0xff);

	t=cmd_writesector(lba);
	if(t!=0)
	{
		puts("Write failed\n");
//		printf("Read command failed at %d (%d)\n",lba,r);
		return(1);
	}

    SPI(0xFF); // one byte gap
    SPI(0xFE); // send Data Token

    // send sector bytes
    for (i = 0; i < 128; i++)
	{
		int t=*(int *)buf;
		SPI((t>>24)&255);
		SPI((t>>16)&255);
		SPI((t>>8)&255);
		SPI(t&255);
		buf+=4;
	}

    SPI(0xFF); // send CRC lo byte
    SPI(0xFF); // send CRC hi byte
    SPI(0xFF); // Pump the response byte

    timeout = 100000;
	do
	{
	    SPI(0xFF);
		i=SPI_READ();
	}
	while((i==0) && --timeout);
	SPI(0xff);
	SPI_DISABLE(HW_SPI_SD);
	return(0);
}


extern void spi_readsector(long *buf);

static int sd_read(unsigned char *buf,int bytes)
{
	int result=0;
	int i=1500000;
	while(--i)
	{
		int v;
		SPI(0xff);
		v=SPI_READ();
		if(v==0xfe)
		{
			if(!buf)
				EnableDirectSD();
			for(;bytes>0;--bytes)
			{
				int t,v;

				t=SPI(0xff);
				if(buf)
					*buf++=t;
			}
			SPI(0xff);
			SPI(0xff);
			if(!buf)
				DisableDirectSD();

			i=1; // break out of the loop
			result=1;
		}
	}
	return(result);
}

int sd_read_sector(unsigned long lba,unsigned char *buf)
{
	int result=0;
	int i;
	int r;
//	printf("sd_read_sector %d, %d\n",lba,buf);
	SPI(0xff);
	SPI_ENABLE_FAST(HW_SPI_SD);
	SPI(0xff);

	r=cmd_read(lba);
	if(r!=0)
	{
		PDBG("Read failed at %d ",lba);
		PDBG("(%d)",r);
		return(result);
	}
	result=sd_read(buf,512);

	SPI_DISABLE(HW_SPI_SD);
	return(result);
}

unsigned char sizebuf[18];
int sd_get_size()
{
	// Reading the card size is much easier for SDHC than regular SD.
	int r;
	r=cmd_CMD9();
	PDBG("CMD9 response: %x\n",r);
	sd_read(sizebuf,18);
	for(r=0;r<18;++r)
	{
		PDBG("%x, ",sizebuf[r]);
	}
	DBG("\n");
	r=0;
	if((sizebuf[0]&0xc0)==0x40)	// V2 CSD
	{
		r=1+(((sizebuf[7]<<16)|(sizebuf[8]<<8)|sizebuf[9])&0x3fffff);
		r<<=10;	// Scale to the number of 512-byte blocks
	}
	else
	{	// Whatever were they smoking when they designed the V1 CSD?
		int c_size_mult=((sizebuf[9]<<1)&6)|(sizebuf[10]>>7);
		int read_bl_len=sizebuf[5]&15;
		int csize=((sizebuf[6]&3)<<10) | sizebuf[7]<<2 | ((sizebuf[8]&0xc0)>>6);
		printf("c_size_mult: %d, read_bl_len: %d, csize: %d\n",c_size_mult,read_bl_len,csize);
		c_size_mult=1<<(2+c_size_mult);
		printf("Mult %d\n",c_size_mult);
		read_bl_len=1<<(read_bl_len);
		r=(csize+1)*c_size_mult;
		printf("%d blocks of size %d\n",r,read_bl_len);
		while(read_bl_len>512)
		{
			r<<=1;
			read_bl_len>>=1;
		}
		printf("%d blocks of 512 bytes\n",r);
	}
	return(r);
}

