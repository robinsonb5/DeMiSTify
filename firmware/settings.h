#ifndef SETTINGS_H

/* If settings files are supported, we provide a default implementation of loading and saving configs,
   which can be replaced in overrides.c */

void configtocore(char *buf);
void coretoconfig(char *buf);
int loadsettings(const char *filename);
int savesettings(const char *filename);

#endif

