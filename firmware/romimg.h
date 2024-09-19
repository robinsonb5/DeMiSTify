#ifndef ROMIMAGE_H
#define ROMIMAGE_H

#include "minfat.h"

extern unsigned char romtype;
extern fileTYPE file;

void GetNVRAM(int idx,char *ptr,int len);
void SendNVRAM(int idx,char *ptr,int len);
int LoadROM(const char *fn);
__weak int loadimage(char *filename,int unit);

#endif

