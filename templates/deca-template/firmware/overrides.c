// Remove anything that is not needed

// Initial ROM 
const char *bootrom_name="NEXT186 ROM";


// Initial VHD
const char *bootvhd_name="NEXT186 VHD";
char *autoboot()
{
	char *result=0;
	if(!LoadROM(bootrom_name))
		result="ROM loading failed";
	loadimage(bootvhd_name,0);
	return(result);
}

//NOTE: if having problems loading VHD you could try to load first VHD and then the ROM
