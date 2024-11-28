#
# Author: Lasse Collin
#
# This file has been put into the public domain.
# You can do whatever you want with this file.
#

CC = gcc
CFLAGS = -std=gnu99 -Wall -g -I ./include -I ./include/lzma -I ../../include
LDFLAGS = -L . -llzma

PROGS = xz_tool

all: $(PROGS)

.c:
	# --- $@ $<
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

clean:
	-rm -f $(PROGS)
