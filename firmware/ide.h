#ifndef IDE_H
#define IDE_H

#include "config.h"

typedef struct
{
	fileTYPE	file;
	int  cylinders;
	int  heads;
	int  sectors;
	int  sectors_per_block;
} hdfTYPE;

#ifndef CONFIG_IDE_UNITS
#define CONFIG_IDE_UNITS 2
#endif

extern hdfTYPE hdf[CONFIG_IDE_UNITS];

void GetHardfileGeometry(hdfTYPE *pHDF);
void OpenHardfile(const char *filename,int unit);
void HandleHDD();

#endif

