BOARD=

all: submodules vbcc firmware init compile

submodules: DeMiSTify/Makefile

.PHONY: vbcc
vbcc:
	make -C DeMiSTify/EightThirtyTwo/ vbcc

DeMiSTify/Makefile:
	git submodule update --init --recursive

.PHONY: firmware
firmware: submodules firmware_overrides
	make -C DeMiSTify firmware OVERRIDES=firmware_overrides

.PHONY: init
init:
	make -C DeMiSTify PROJECTS=nes BOARD=$(BOARD) init 

.PHONY: compile
compile:
	make -C DeMiSTify PROJECTS=nes BOARD=$(BOARD) compile

.PHONY: clean
clean:
	make -C DeMiSTify PROJECTS=nes BOARD=$(BOARD) clean

