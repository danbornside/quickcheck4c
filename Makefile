CC=gcc
LD=gcc

CFLAGS=-g -Wall
INSTALL=install

EXE=example
SO=libquickcheck4c.so

all: $(EXE) $(SO)

example: example.o quickcheck4c.o
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%: %.o
	$(LD) $(LDFLAGS) -o $@ $<

$(SO): quickcheck4c.o
	$(CC) -shared -o $@ $^

.PHONY: clean

clean:
	rm -f $(EXE) $(SO)
	rm -f *.o test

.PHONY: install

install:
	mkdir -p $(DESTDIR)/lib
	$(INSTALL) $(SO) $(DESTDIR)/lib
	mkdir -p $(DESTDIR)/include
	$(INSTALL) quickcheck4c.h $(DESTDIR)/include
	mkdir -p $(DESTDIR)/share/doc
	$(INSTALL) LICENSE README.md example.c $(DESTDIR)/share/doc
