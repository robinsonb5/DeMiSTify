#ifndef _FAT16_H_INCLUDED
#define _FAT16_H_INCLUDED

#define MAXDIRENTRIES 8

#include "sys/types.h"

typedef struct
{
    uint32_t sector;          /* sector index in file */
    uint32_t size;            /* file size */
    uint32_t cluster;         /* current cluster */
} fileTYPE;

struct PartitionEntry
{
	unsigned char geometry[8];		// ignored
	uint32_t startlba;
	uint32_t sectors;
};// __attribute__ ((packed));

struct MasterBootRecord
{
	unsigned char bootcode[446];	// ignored
	unsigned char Partition[4][16];
//	struct PartitionEntry Partition[4];	// We copy these (and byteswap if need be)
	uint16_t Signature;		// This lets us detect an MBR (and the need for byteswapping).
};// __attribute__ ((packed));

//extern struct PartitionEntry partitions[4];	// FirstBlock and LastBlock will be byteswapped as necessary
//extern int partitioncount;

typedef struct
{
    unsigned char       Name[8];            /* filename, blank filled */
#define SLOT_EMPTY      0x00                /* slot has never been used */
#define SLOT_E5         0x05                /* the real value is 0xe5 */
#define SLOT_DELETED    0xe5                /* file in this slot deleted */
    unsigned char       Extension[3];       /* extension, blank filled */
    unsigned char       Attributes;         /* file attributes */
#define ATTR_NORMAL     0x00                /* normal file */
#define ATTR_READONLY   0x01                /* file is readonly */
#define ATTR_HIDDEN     0x02                /* file is hidden */
#define ATTR_SYSTEM     0x04                /* file is a system file */
#define ATTR_VOLUME     0x08                /* entry is a volume label */
#define ATTR_DIRECTORY  0x10                /* entry is a directory name */
#define ATTR_ARCHIVE    0x20                /* file is new or modified */
#define ATTR_LFN        0x0F                /* int32_t file name entry */
    unsigned char       LowerCase;          /* NT VFAT lower case flags */
#define LCASE_BASE      0x08                /* filename base in lower case */
#define LCASE_EXT       0x10                /* filename extension in lower case */
    unsigned char       CreateHundredth;    /* hundredth of seconds in CTime */
    uint16_t      CreateTime;         /* create time */
    uint16_t      CreateDate;         /* create date */
    uint16_t      AccessDate;         /* access date */
    uint16_t      HighCluster;        /* high bytes of cluster number */
    uint16_t      ModifyTime;         /* last update time */
    uint16_t      ModifyDate;         /* last update date */
    uint16_t      StartCluster;       /* starting cluster of file */
    uint32_t       FileSize;           /* size of file in bytes */
} DIRENTRY;

typedef union {
    uint16_t fat16[256];
    uint32_t  fat32[128];
} FATBUFFER;

#define FILETIME(h,m,s) (((h<<11)&0xF800)|((m<<5)&0x7E0)|((s/2)&0x1F))
#define FILEDATE(y,m,d) ((((y-1980)<<9)&0xFE00)|((m<<5)&0x1E0)|(d&0x1F))

// global sector buffer, data for read/write actions is stored here.
// BEWARE, this buffer is also used and thus trashed by all other functions
extern unsigned char sector_buffer[512];
//extern unsigned char *sector_buffer;
extern unsigned int cluster_size;
extern uint32_t cluster_mask;
extern unsigned int fat32;

// constants
#define DIRECTORY_ROOT 0

// file seeking
#define SEEK_SET  0
#define SEEK_CUR  1

// scanning flags
#define SCAN_INIT  0       // start search from beginning of directory
#define SCAN_NEXT  1       // find next file in directory
#define SCAN_PREV -1       // find previous file in directory
#define SCAN_NEXT_PAGE   2 // find next 8 files in directory
#define SCAN_PREV_PAGE  -2 // find previous 8 files in directory
#define SCAN_INIT_FIRST  3 // search for an entry with given cluster number
#define SCAN_INIT_NEXT   4 // search for entries higher than the first one

// options flags
#define SCAN_DIR   1 // include subdirectories
#define SCAN_LFN   2 // include int32_t file names
#define FIND_DIR   4 // find first directory beginning with given charater
#define FIND_FILE  8 // find first file entry beginning with given charater


// functions
unsigned int FindDrive(void);
unsigned int GetFATLink(unsigned int cluster);
unsigned int FileNextSector(fileTYPE *file);
unsigned int FileOpen(fileTYPE *file, const char *name);
unsigned int FileRead(fileTYPE *file, unsigned char *pBuffer);
//unsigned char FileReadEx(fileTYPE *file, unsigned char *pBuffer, uint32_t nSize);

int LoadFile(const char *fn, unsigned char *buf);

void ChangeDirectory(DIRENTRY *p);
DIRENTRY *NextDirEntry(int prev,int (*matchfunc)(const char *fn));
extern unsigned int dir_entries;             // number of entry's in directory table
extern char longfilename[260];

#endif

