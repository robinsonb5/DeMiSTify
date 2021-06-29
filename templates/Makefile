DEMISTIFYPATH=DeMiSTify
SUBMODULES=$(DEMISTIFYPATH)/EightThirtyTwo/Makefile
PROJECT=tgfx16
PROJECTPATH=./
PROJECTTOROOT=../
BOARD=

all: $(DEMISTIFYPATH)/site.mk firmware init compile tns mist

$(DEMISTIFYPATH)/site.mk: $(SUBMODULES)
	$(info ******************************************************)
	$(info Please copy the example DeMiSTify/site.template file to)
	$(info DeMiSTify/site.mk and edit the paths for the version(s))
	$(info  of Quartus you have installed.)
	$(info *******************************************************)
	$(error site.mk not found.)

include $(DEMISTIFYPATH)/site.mk

$(SUBMODULES):
	git submodule update --init --recursive
	make -C $(DEMISTIFYPATH) -f bootstrap.mk

.PHONY: firmware
firmware: $(SUBMODULES)
	make -C firmware -f ../$(DEMISTIFYPATH)/Scripts/firmware.mk DEMISTIFYPATH=../$(DEMISTIFYPATH)

.PHONY: init
init:
	make -f $(DEMISTIFYPATH)/Makefile DEMISTIFYPATH=$(DEMISTIFYPATH) PROJECTTOROOT=$(PROJECTTOROOT) PROJECTPATH=$(PROJECTPATH) PROJECTS=$(PROJECT) BOARD=$(BOARD) init 

.PHONY: buildid
buildid:
	cd toplevels; \
	$(Q13)/quartus_sh -t ../mist/build_id_verilog.tcl

.PHONY: compile
compile: buildid
	make -f $(DEMISTIFYPATH)/Makefile DEMISTIFYPATH=$(DEMISTIFYPATH) PROJECTTOROOT=$(PROJECTTOROOT) PROJECTPATH=$(PROJECTPATH) PROJECTS=$(PROJECT) BOARD=$(BOARD) compile

.PHONY: clean
clean:
	make -f $(DEMISTIFYPATH)/Makefile DEMISTIFYPATH=$(DEMISTIFYPATH) PROJECTTOROOT=$(PROJECTTOROOT) PROJECTPATH=$(PROJECTPATH) PROJECTS=$(PROJECT) BOARD=$(BOARD) clean

.PHONY: tns
tns:
	grep -r Design-wide\ TNS fpga/*

.PHONY: mist
mist:
	$(Q13)/quartus_sh --flow compile Board/mist/fpgagen.qpf

