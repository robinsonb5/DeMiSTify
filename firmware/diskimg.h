#ifndef DISKIMG_H
#define DISKIMG_H

#include "config.h"
#include "minfat.h"

#ifndef CONFIG_DISKIMG_UNITS
#define CONFIG_DISKIMG_UNITS 4
#endif

#define DISKIMG_SDCARD_NAME "<SDCard>"
#define DISKIMG_SDCARD_MARKER 0xffffff5D

struct diskimage
{
	union {
		fileTYPE file;
		struct {
			int marker;
		} direct;
	} type;
};

extern struct diskimage diskimg[CONFIG_DISKIMG_UNITS];

void diskimg_poll();
int diskimg_mount(const unsigned char *name, unsigned char idx);

#endif
