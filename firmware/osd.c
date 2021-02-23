
#include "osd.h"
#include "spi.h"
#include "font.h"

void spi_osd_cmd_cont(unsigned char cmd) {
  EnableOsd();
  SPI(cmd);
}

void spi_osd_cmd(unsigned char cmd) {
  spi_osd_cmd_cont(cmd);
  DisableOsd();
}

void spi_osd_cmd8_cont(unsigned char cmd, unsigned char parm) {
  EnableOsd();
  SPI(cmd);
  SPI(parm);
}

void spi_osd_cmd8(unsigned char cmd, unsigned char parm) {
  spi_osd_cmd8_cont(cmd, parm);
  DisableOsd();
}

static int osd_col;
static int osd_inv;
static int osd_stipple;
static int osd_writing;

void OsdWriteStart(int row,int inverse,int stipple)
{
	if(osd_writing)
		OsdWriteEnd();
    EnableOsd();
    SPI(MM1_OSDCMDWRITE|row);
	osd_col=0;
	osd_inv=inverse ? 255 : 0;
	osd_stipple=stipple ? 0x5555 : 0xffff;
	osd_writing=1;
}

void OsdPutChar(unsigned char c)
{
	int stipplemask=osd_stipple;
	int i;
    const unsigned char *p;
	if(c)
		p=&font[c-FONT_OFFSET][0];
	else
		p=&font[0][0];
	for(i=0;i<8;++i)
	{
        SPI((*p++&stipplemask)^osd_inv);
		stipplemask>>=1;
	}
	osd_col+=8;
}

void OsdPuts(unsigned char *s)
{
	unsigned char c;
	while(c=*s++)
		OsdPutChar(c);
}

void OsdWriteEnd()
{
	int i;
	while(osd_col++<OSDLINELEN)
		SPI(osd_inv);
	DisableOsd();
	osd_writing=0;
}

#if 0
// write a null-terminated string <s> to the OSD buffer starting at line <n>
void OsdWrite(int n, char *s, int invert, int stipple)
{
    int i;
    int b;
	const unsigned char *f;
    const unsigned char *p;
	int stipplemask=0xff;
	int linelimit=OSDLINELEN/8;

	if(stipple)
	{
		stipplemask=0x55;
		stipple=0xff;
	}
	else
		stipple=0;

    // select OSD SPI device
    EnableOsd();

    SPI(MM1_OSDCMDWRITE|n);

	if(invert)
		invert=255;

	// Offset font:
	f=&font[-FONT_OFFSET][0];
//	f-=8*FONT_OFFSET;

    i = 0;
    // send all characters in string to OSD
	b=*s++;
	while(linelimit--)
	{
        if(b)
			p = f+(b<<3);
		else
			p = &font[0][0];
		for(i=0;i<8;++i)
		{
	        SPI((*p++&stipplemask)^invert);	stipplemask^=stipple;
		}
		if(b)
			b = *s++;
    }

    // deselect OSD SPI device
    DisableOsd();
}
#endif

