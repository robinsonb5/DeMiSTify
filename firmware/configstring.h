#ifndef CONFIGSTRING_H
#define CONFIGSTRING_H

extern unsigned char configstring_index;

void configstring_begin();
void configstring_end();
int configstring_next();
int configstring_nextfield();
int configstring_copytocomma(char *buf, int limit,int copy);
int configstring_getdigit();
int configstring_setindex(int idx);
int configstring_matchextension(const char *ext);

#endif

