DEMISTIFYPATH=../
832DIR=$(DEMISTIFYPATH)/EightThirtyTwo
CC=$(832DIR)/vbcc/bin/vbcc832
AS=$(832DIR)/832a/832a
LD=$(832DIR)/832a/832l
DUMP=objdump
INCDIR=$(832DIR)/include/
LIBDIR=$(832DIR)/lib832
# Sizes of the two ROM parts - 8k + 4k = 12k by default
ROMSIZE1=8192
ROMSIZE2=4096

CDEFS =
CFLAGS = -+ -c99 -O=1343 -speed -unsigned-char -I. $(CDEFS)
ASFLAGS = -el
LDFLAGS  = -el -s_STACKSIZE=0x200

START = $(LIBDIR)/crt0.a
LIBS = $(LIBDIR)/libtiny832.a

PRJ_OBJ = spi.o spi_sd.o minfat.o swap.o configstring.o main.o interrupts.o ps2.o keyboard.o user_io.o \
	osd.o font.o menu.o cue_parser.o pcecd.o timer.o diskimg.o overrides.o

ROMGENDIR = $(DEMISTIFYPATH)/EightThirtyTwo/romgen
ROMGEN = $(ROMGENDIR)/romgen

all: controller_rom_byte.vhd controller_rom_word.vhd

lib: libdemistify.a

clean :
	-rm *.asm
	-rm *.S
	-rm *.o
	-rm *_byte.vhd
	-rm *_word.vhd
	-rm *.bin
	-rm *.elf
	-rm *.a

%_rom_word.vhd: %.bin $(ROMGEN)
	sed 's/eightthirtytwo_rom/$*_rom/' >$*_rom_word.vhd <$(ROMGENDIR)/rom_prologue_word.vhd
	$(ROMGEN) -b -w $*.bin >>$*_rom_word.vhd
	cat >>$*_rom_word.vhd $(ROMGENDIR)/rom_epilogue_word.vhd

# Create both full-size and split versions of the ROM to help minimise BRAM usage:
%_rom_byte.vhd: %.bin $(ROMGEN)
	sed 's/eightthirtytwo_rom/$*_rom/' >$*_rom_byte.vhd <$(ROMGENDIR)/rom_prologue_byte.vhd
	$(ROMGEN) -b $*.bin >>$*_rom_byte.vhd
	cat >>$*_rom_byte.vhd $(ROMGENDIR)/rom_epilogue_byte.vhd
	sed 's/eightthirtytwo_rom/$*_rom1/' >$*_rom1_byte.vhd <$(ROMGENDIR)/rom_prologue_byte.vhd
	$(ROMGEN) -b -l$(ROMSIZE1) $*.bin >>$*_rom1_byte.vhd
	cat >>$*_rom1_byte.vhd $(ROMGENDIR)/rom_epilogue_byte.vhd
	sed 's/eightthirtytwo_rom/$*_rom2/' >$*_rom2_byte.vhd <$(ROMGENDIR)/rom_prologue_byte.vhd
	$(ROMGEN) -b -o$(ROMSIZE1) -l$(ROMSIZE2) $*.bin >>$*_rom2_byte.vhd
	cat >>$*_rom2_byte.vhd $(ROMGENDIR)/rom_epilogue_byte.vhd
	grep __bss_ $*.map

empty:=
space:= $(empty) $(empty)

controller.bin : $(START) $(LIBS) $(PRJ_OBJ)
	$(LD) $(LDFLAGS) -o $@ -M controller.map $+

%.o : $(DEMISTIFYPATH)/firmware/%.c
	$(CC) $(COPT) $(CFLAGS) -I$(INCDIR) -o=$*.asm $(DEMISTIFYPATH)/firmware/$*.c
	$(AS) $(ASFLAGS) -o $*.o $*.asm

%.o : %.c
	$(CC) $(COPT) $(CFLAGS) -I$(INCDIR) -I$(DEMISTIFYPATH)/firmware -o=$*.asm $*.c
	$(AS) $(ASFLAGS) -o $*.o $*.asm

%.o : $(LIBDIR)/%.asm Makefile 
	$(AS) $(ASFLAGS) -o $*.o $(LIBDIR)/$*.asm

%.asm : $(DEMISTIFYPATH)/firmware/%.c
	$(CC) $(COPT) $(CFLAGS) -I$(INCDIR) $*.c

$(ROMGEN): $(ROMGENDIR)/romgen.c
	gcc -o $(ROMGENDIR)/romgen $(ROMGENDIR)/romgen.c

force:

