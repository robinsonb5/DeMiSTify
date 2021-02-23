PROJECTS=

include site.mk

all: site.mk firmware init compile

firmware:
	make -f firmware.mk PROJECTS=$(PROJECTS)

site.mk:
	$(info Copy the example site.template file to site.mk)
	$(info and edit the paths for the version(s) of Quartus)
	$(info you have installed.)
	$(error site.mk not found.)

init:
ifdef BOARD
	@make -f Scripts/project.mk PROJECTS=$(PROJECTS) BOARD=$(BOARD) CMD=init
else
	@for BOARD in ${BOARDS}; do \
		make -f Scripts/project.mk PROJECTS=$(PROJECTS) BOARD=$$BOARD CMD=init; \
	done
endif

compile:
ifdef BOARD
	@make -f Scripts/project.mk PROJECTS=$(PROJECTS) BOARD=$(BOARD) CMD=compile
else
	@for BOARD in ${BOARDS}; do \
		make --quiet -f Scripts/project.mk PROJECTS=$(PROJECTS) BOARD=$$BOARD CMD=compile; \
	done
endif

clean:
ifdef BOARD
	@make -f Scripts/project.mk PROJECTS=$(PROJECTS) BOARD=$(BOARD) CMD=clean
else
	@for BOARD in ${BOARDS}; do \
		make -f Scripts/project.mk PROJECTS=$(PROJECTS) BOARD=$$BOARD CMD=clean; \
	done
endif

