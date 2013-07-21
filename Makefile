# Makefile for C hashtable
# Copyright (c) 2002, 2004, 2013, Christopher Clark
#
# Now at: https://github.com/dozylynx/C-hashtable
#
# Formerly at: http://www.cl.cam.ac.uk/~cwc22/hashtable/
# archived at: http://web.archive.org/web/20101119053156/http://www.cl.cam.ac.uk/~cwc22/hashtable/

tester: hashtable.o tester.o hashtable_itr.o
	gcc -g -Wall -O -o tester hashtable.o hashtable_itr.o tester.o -lm

all: tester old_tester

tester.o:	tester.c
	gcc -g -Wall -Wno-unused-but-set-variable -O -c tester.c -o tester.o

old_tester: hashtable_powers.o tester.o hashtable_itr.o
	gcc -g -Wall -O -o old_tester hashtable_powers.o hashtable_itr.o tester.o -lm

hashtable_powers.o:	hashtable_powers.c
	gcc -g -Wall -O -c hashtable_powers.c -o hashtable_powers.o

hashtable.o:	hashtable.c
	gcc -g -Wall -O -c hashtable.c -o hashtable.o

hashtable_itr.o: hashtable_itr.c
	gcc -g -Wall -O -c hashtable_itr.c -o hashtable_itr.o

tidy:
	rm *.o

clean: tidy
	rm -f tester old_tester
