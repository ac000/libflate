CC	= gcc
CFLAGS	= -Wall -Wextra -O2 -g -Wp,-D_FORTIFY_SOURCE=2 -D_FILE_OFFSET_BITS=64 \
	  -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fPIC \
	  -Wno-unused-result
AR	= ar -r
RM	= rm -f

all:	libflate checktpl

libflate: flate.o
	$(AR) libflate.a flate.o

flate.o: flate.c
	$(CC) $(CFLAGS) flate.c -c -I.

clean:
	$(RM) flate.o libflate.a checktpl
