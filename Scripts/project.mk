PROJECTS =
BOARD = 
CMD =

# Bring in site-specific configuration (paths to tools, etc.)
include site.mk

# Bring in board-specific defines (which tool-specific makefile and tool version to use).
include Board/$(BOARD)/board.mk

all:
	@for PROJECT in ${PROJECTS}; do \
		mkdir -p ../fpga/$$BOARD; \
		make --quiet -C ../fpga/$$BOARD -f ../../DeMiSTify/Scripts/$(TOOL_MAKEFILE) BOARD=$(BOARD) PROJECT=$$PROJECT TOOLPATH=$(TOOLPATH) $(CMD); \
	done

