DEMISTIFYPATH=DeMiSTify
PROJECT=nes
BOARD=

all: submodules vbcc firmware init compile tns

submodules: $(DEMISTIFYPATH)/Makefile

.PHONY: vbcc
vbcc:
	make -C $(DEMISTIFYPATH)/EightThirtyTwo/ vbcc

$(DEMISTIFYPATH)/DeMiSTify/Makefile:
	git submodule update --init --recursive

.PHONY: firmware
firmware: submodules
	make -C firmware -f ../$(DEMISTIFYPATH)/Scripts/firmware.mk DEMISTIFYPATH=../$(DEMISTIFYPATH)

.PHONY: init
init:
	make -f $(DEMISTIFYPATH)/Makefile DEMISTIFYPATH=$(DEMISTIFYPATH) PROJECTS=$(PROJECT) BOARD=$(BOARD) init 

.PHONY: compile
compile:
	make -f $(DEMISTIFYPATH)/Makefile DEMISTIFYPATH=$(DEMISTIFYPATH) PROJECTS=$(PROJECT) BOARD=$(BOARD) compile

.PHONY: clean
clean:
	make -f $(DEMISTIFYPATH)/Makefile DEMISTIFYPATH=$(DEMISTIFYPATH) PROJECTS=$(PROJECT) BOARD=$(BOARD) clean

.PHONY: tns
tns:
	grep -r Design-wide\ TNS fpga/*

