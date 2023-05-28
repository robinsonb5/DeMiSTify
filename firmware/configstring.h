#ifndef CONFIGSTRING_H
#define CONFIGSTRING_H

#define CONFIGSTRING_INDEX_CFG 0x1f
#define CONFIGSTRING_INDEX_ARC 0x1e

extern unsigned char configstring_index;
extern unsigned char configstring_coretype;
#define DIRECTUPLOAD 0x10
#define configstring_direct_upload(x) (configstring_coretype&DIRECTUPLOAD)

void configstring_begin();
void configstring_end();
int configstring_next();
int configstring_nextfield();

/* Copy a maximum of limit bytes to the output string, stopping when a comma is reached. */
/* If the copy flag is zero, don't copy, just consume bytes from the input.
   Returns the number of characters copied, negated if the copy was stopped by a semicolon. */
int configstring_copytocomma(char *buf, int limit,int copy);

int configstring_getdigit();
int configstring_setindex(const char *fn);
int configstring_matchextension(const char *ext);

/* Fetch a number of characters from the configstring's corename field, padded with spaces
   BEWARE - null terminated, so buffer must have room for one extra byte. */
void configstring_getcorename(char *corename,int chars);


#endif

