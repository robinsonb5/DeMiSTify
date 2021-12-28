#ifndef STATUSWORD_H
#define STATUSWORD_H

extern unsigned int statusword; /* Support 32-bit status word initially - need to be 64-bit in the long run */

__weak void sendstatus();

#endif

