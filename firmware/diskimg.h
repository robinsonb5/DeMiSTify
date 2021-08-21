#ifndef DISKIMG_H
#define DISKIMG_H

#include "config.h"

#ifndef CONFIG_DISKIMG_UNITS
#define CONFIG_DISKIMG_UNITS 4
#endif

void diskimg_poll();
void diskimg_mount(const unsigned char *name, unsigned char idx);

#endif
