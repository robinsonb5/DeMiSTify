DEMISTIFYPATH=
832DIR=$(DEMISTIFYPATH)/EightThirtyTwo
FWDIR=$(DEMISTIFYPATH)/firmware/
AS=$(832DIR)/832a/832a
LD=$(832DIR)/832a/832l
CC=$(832DIR)/vbcc/bin/vbcc832
COPT = -O=1343 -size
CFLAGS = -+ -unsigned-char $(COPT) -I$(832DIR)/include/ -I$(FWDIR)
ASFLAGS = -el
LDFLAGS  = -el -s_STACKSIZE=0x100

START = $(LIBDIR)/crt0.a
LIBS = $(LIBDIR)/libtiny832.a $(FWDIR)/libdemistify.a

INCDIR=$(832DIR)/include/
LIBDIR=$(832DIR)/lib832
ROMGENDIR = $(DEMISTIFYPATH)/EightThirtyTwo/romgen
ROMGEN = $(ROMGENDIR)/romgen

OBJDIR=832dir

OBJ=overrides.o

all: controller.bin controller_rom_byte.vhd controller_rom_word.vhd

%_rom_word.vhd: %.bin $(ROMGEN)
	sed 's/eightthirtytwo_rom/$*_rom/' >$*_rom_word.vhd <$(ROMGENDIR)/rom_prologue_word.vhd
	$(ROMGEN) -b -w $*.bin >>$*_rom_word.vhd
	cat >>$*_rom_word.vhd $(ROMGENDIR)/rom_epilogue_word.vhd

%_rom_byte.vhd: %.bin $(ROMGEN)
	sed 's/eightthirtytwo_rom/$*_rom/' >$*_rom_byte.vhd <$(ROMGENDIR)/rom_prologue_byte.vhd
	$(ROMGEN) -b $*.bin >>$*_rom_byte.vhd
	cat >>$*_rom_byte.vhd $(ROMGENDIR)/rom_epilogue_byte.vhd
	sed 's/eightthirtytwo_rom/$*_rom1/' >$*_rom1_byte.vhd <$(ROMGENDIR)/rom_prologue_byte.vhd
	$(ROMGEN) -b -l8192 $*.bin >>$*_rom1_byte.vhd
	cat >>$*_rom1_byte.vhd $(ROMGENDIR)/rom_epilogue_byte.vhd
	sed 's/eightthirtytwo_rom/$*_rom2/' >$*_rom2_byte.vhd <$(ROMGENDIR)/rom_prologue_byte.vhd
	$(ROMGEN) -b -o8192 -l4096 $*.bin >>$*_rom2_byte.vhd
	cat >>$*_rom2_byte.vhd $(ROMGENDIR)/rom_epilogue_byte.vhd
	grep __bss_ $*.map

clean :
	-rm *.asm
	-rm *.o
	-rm *.a
	-rm *_byte.vhd
	-rm *_word.vhd
	-rm *.bin
	-rm *.elf


$(FWDIR)/libdemistify.a:
	make -C $(FWDIR) DEMISTIFYPATH=$(DEMISTIFYPATH) lib

controller.bin : $(START) $(LIBS) $(OBJ)
	$(LD) $(LDFLAGS) -o $@ -M controller.map $+


%.o : %.asm
	$(AS) -o $@ $*.asm

%.asm : %.c
	$(CC) $(CFLAGS) $*.c

%.o : %.c
	$(CC) $(CFLAGS) $*.c
	$(AS) -o $@ $*.asm

