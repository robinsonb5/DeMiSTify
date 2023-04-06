CC = gcc

all: test.csv

clean:
	rm test.csv
	rm bookmarks

test.csv: bookmarks
	@./bookmarks > test.csv
	$(info )
	$(info Analyzed bookmarks resulting from random seeks.)
	$(info Bookmark positions in test.csv should be roughly equidistant,)
	$(info despite their random order.)

bookmarks: bookmarks.c
	$(CC) bookmarks.c -o bookmarks

