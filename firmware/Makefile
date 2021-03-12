832DIR=../EightThirtyTwo
CC=$(832DIR)/vbcc/bin/vbcc832
AS=$(832DIR)/832a/832a
LD=$(832DIR)/832a/832l
DUMP=objdump
INCDIR=$(832DIR)/include/
LIBDIR=$(832DIR)/lib832

CFLAGS = -+ -O=1343 -size -unsigned-char
ASFLAGS = -el
LDFLAGS  = -el -s_STACKSIZE=0x100

START = $(LIBDIR)/crt0.a
LIBS = $(LIBDIR)/libtiny832.a libdemistify.a

PRJ_OBJ = uart.o spi_sd.o minfat.o swap.o main.o interrupts.o ps2.o keyboard.o userio.o osd.o font.o menu.o

ROMGENDIR = ../EightThirtyTwo/romgen
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

empty:=
space:= $(empty) $(empty)

libdemistify.a: $(PRJ_OBJ)
	cat > $@ $+

controller.bin : $(START) $(LIBS)
ifdef OVERRIDES
	make -C $(subst $(space),\$(space),$(OVERRIDES))
	$(LD) $(LDFLAGS) -o $@ -M controller.map $+ $(subst $(space),\$(space),$(OVERRIDES))/overrides.a
else
	$(LD) $(LDFLAGS) -o $@ -M controller.map $+
endif


%.o : %.c Makefile
	$(CC) $(COPT) $(CFLAGS) -I$(INCDIR) $*.c
	$(AS) $(ASFLAGS) -o $*.o $*.asm

%.o : $(LIBDIR)/%.asm Makefile 
	$(AS) $(ASFLAGS) -o $*.o $(LIBDIR)/$*.asm

%.asm : %.c Makefile
	$(CC) $(COPT) $(CFLAGS) -I$(INCDIR) $*.c

$(ROMGEN): $(ROMGENDIR)/romgen.c
	gcc -o $(ROMGENDIR)/romgen $(ROMGENDIR)/romgen.c

force:

