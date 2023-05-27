#ifndef SETTINGS_H

/* If settings files are supported, we provide a default implementation of loading and saving configs,
   which can be replaced in overrides.c */

int configtocore(char *buf);
void coretoconfig(char *buf);
int loadsettings(const char *filename);
int savesettings(const char *filename);

/* Suggested directory/filename tuple for use in config files */
struct settings_blob
{
	int dir;
	char filename[12];
};

/* Utility functions to loadimage() a blob, taking care of changing directory,
   and storing a filename with its current directory to a tuple. */
int settings_loadblob(struct settings_blob *part,int unit);
void settings_storeblob(struct settings_blob *part,const char *filename);

#define SCANDOUBLE_OFF 1
#define SCANDOUBLE_ON 0
#define AUTOSCANDOUBLER_FILENAME "15KHZ   CFG"
extern int scandouble;
void ToggleScandoubler();
void AutoScandoubler();
#define GetScandouble() scandouble
#define SetScandouble(x) { scandouble=1^(x); ToggleScandoubler(); }
#endif

