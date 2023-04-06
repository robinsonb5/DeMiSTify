#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define CONFIG_FILEBOOKMARKS 16

typedef unsigned int uint32_t;
typedef unsigned short uint16_t;

struct fileBookmark
{
	uint32_t sector;
	uint32_t cluster;
};

typedef struct
{
    uint32_t sector;          /* sector index in file */
    uint32_t cluster;         /* current cluster */
    uint32_t size;            /* file size */
    uint32_t firstcluster;
	uint32_t cursor;	/* Offset within the current sector */
#ifdef CONFIG_FILEBOOKMARKS
	struct fileBookmark bookmarks[CONFIG_FILEBOOKMARKS];
	int bookmark_threshold;
//	int bookmark_index;
#endif
} fileTYPE;

#define tolower(x) (x|32)

// internal global variables
unsigned int cluster_size;             // size of a cluster in sectors
uint32_t cluster_mask;             // binary mask of cluster number

unsigned int FindDrive()
{
    // get cluster_size
    cluster_size = 16;

    // calculate cluster mask
    cluster_mask = cluster_size - 1;

	printf("Cluster size: %d\n",cluster_size);
	printf("Cluster mask, %d\n",cluster_mask);
	return(1);
}

uint32_t GetCluster(uint32_t cluster)
{
	return(cluster+1);
}


void FileNextSector(fileTYPE *file,int count)
{
    uint32_t sb;
    uint16_t i;
	if(!file || !file->size)
		return;
	count+=file->sector;
	while((file->sector ^ count)&~cluster_mask)
	{
		file->cluster=GetCluster(file->cluster);
		file->sector+=cluster_size;
	}
	file->sector=count;
}


void DumpBookmarks(fileTYPE *file)
{
	int idx;
	if(!file || !file->size)
		return;
	for(idx=0;idx<CONFIG_FILEBOOKMARKS;++idx)
	{
		if(idx)
		{
			putchar(',');
			putchar(' ');
		}
		printf("%d",file->bookmarks[idx].sector);
	}
	putchar('\n');
}


int BestBookmark(fileTYPE *file, uint32_t pm)
{
	int idx,best;
	uint32_t bestd,d;
	best=-1;
	bestd=file->size;
	for(idx=0;idx<CONFIG_FILEBOOKMARKS;++idx)
	{
		uint32_t t=file->bookmarks[idx].sector;
		d=pm-t;
		if(pm>=t && d<bestd)
		{
			best=idx;
			bestd=d;
		}
	}
	return(best);
}


/* Find the least useful bookmark */
int WorstBookmark(fileTYPE *file)
{
	int idx,idx2;
	uint32_t worstd=0x7fffffff;
	int worst=-1;
	for(idx=0;idx<CONFIG_FILEBOOKMARKS;++idx)
	{
		for(idx2=0;idx2<CONFIG_FILEBOOKMARKS;++idx2)
		{
			int32_t d;
			d=file->bookmarks[idx2].sector-file->bookmarks[idx].sector;
			
			if(idx==idx2)
				d=file->bookmarks[idx].sector;

			if(d>=0 && d<worstd)
			{
				worst=idx2;
				worstd=d;
			}
		}
	}
	return(worst);
}


void FileSeek(fileTYPE *file, uint32_t pos)
{
	uint32_t p=pos>>9;
	uint32_t pm=p;
	uint32_t currentsector;
	uint32_t cluster;

	if(!file || !file->size)
		return;

	if(p==file->sector)
		return;

	pm&=~cluster_mask;
	currentsector=file->sector&~cluster_mask;
	cluster=file->cluster;

//	printf("Seeking to %x\n",pos);

	if(pm==currentsector)	// Is the new position within the same cluster?
	{
		file->sector=p;
//		printf("In same cluster\n");
	}
	else	// Crossing a cluster boundary
	{
		int idx;
		idx=BestBookmark(file,pm);
//		printf("Crossing cluster boundary - best bookmark: %d\n",idx);
		if(idx>=0)
		{
//			printf("Found bookmark %d for %x (%x, %x)\n",idx,pm,file->bookmarks[idx].sector,file->bookmarks[idx].cluster);
			file->sector=file->bookmarks[idx].sector;
			file->cluster=file->bookmarks[idx].cluster;
		}
		else
		{
//			printf("No bookmark found\n");
			file->sector=0;
			file->cluster=file->firstcluster;
		}

		/* record bookmark */
		p-=file->sector;

		idx=BestBookmark(file,currentsector);
//		printf("Best bookmark for old position: %d\n",idx);

		/* We don't bother bookmarking at the start of the file, or if we're within bookmark_threshold of an existing bookmark */
		if(((currentsector>file->bookmark_threshold) && (idx<0)) || 
			((idx>=0) && (currentsector-file->bookmarks[idx].sector) > file->bookmark_threshold))
		{
			idx=WorstBookmark(file);
//			printf("No good bookmark for %x, saving to %d\n",currentsector,idx);
			file->bookmarks[idx].sector=currentsector;
			file->bookmarks[idx].cluster=cluster;
		}

		FileNextSector(file,p);
	}
	file->cursor=pos;
}


int main(int argc,char **argv)
{
	int i;
	fileTYPE testfile;
	testfile.size=3500000000;
	testfile.sector=0;
	testfile.cluster=0;
	testfile.firstcluster=0;
	testfile.cursor=9;
	testfile.bookmark_threshold=(testfile.size>>9)/(CONFIG_FILEBOOKMARKS*4);
	for(i=0;i<CONFIG_FILEBOOKMARKS;++i)
	{
		testfile.bookmarks[i].sector=0;
		testfile.bookmarks[i].cluster=0;
	}
	FindDrive();
//	printf("File size %ud, threshold %x\n",testfile.size,testfile.bookmark_threshold);
	DumpBookmarks(&testfile);
	for(i=0;i<500;++i)
	{
		unsigned int t=rand();
		t%=(testfile.size>>9);
		t<<=9;
		FileSeek(&testfile,t<<9);
		DumpBookmarks(&testfile);
	}
	return(0);
}

