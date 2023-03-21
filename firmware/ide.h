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

extern hdfTYPE hdf[CONFIG_IDE_UNITS];

void GetHardfileGeometry(hdfTYPE *pHDF);
void OpenHardfile(const char *filename,int unit);
void HandleHDD();

#endif

