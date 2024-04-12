SOURCES8=$(wildcard src/6502/*.s)
OBJECTS8=$(SOURCES8:.s=.o)


ifeq ($(CC65_HOME),)
        CC = cl65
        AS = ca65
        LD = ld65
        AR = ar65
else
        CC = $(CC65_HOME)/bin/cl65
        AS = $(CC65_HOME)/bin/ca65
        LD = $(CC65_HOME)/bin/ld65
        AR = $(CC65_HOME)/bin/ar65
endif

all: $(SOURCES8) $(OBJECTS8) tool

$(OBJECTS8): $(SOURCES8)
	@mkdir target/telestrat/lib/ -p
	@$(AS) -ttelestrat $(@:.o=.s) -o $@ --include-dir src/include
	@echo Generating $@
	@$(AR) r ch395-8.lib $@
	@mkdir -p build/lib8
	@mkdir -p build/usr/include/
	@mkdir -p build/usr/include/asm
	@cp src/include/ch395.h build/usr/include/
	@cp src/include/ch395.inc build/usr/include/asm/
	@cp ch395-8.lib build/lib8/
	@cp ch395-8.lib target/telestrat/lib/

test:
	$(CC) -ttelestrat -I src/include test/ch395.c target/telestrat/lib/ch395-8.lib -o ch395
	cl65 -ttelestrat -I src/include test/getstate.c target/telestrat/lib/ch395-8.lib -o getstate

tool:
	@mkdir -p target/telestrat/ch395cfg/
	$(CC) -ttelestrat -I src/include tools/ch395cfg/src/main.c target/telestrat/lib/ch395-8.lib -o target/telestrat/ch395cfg/ch395cfg
	#$(CC) -ttelestrat -I src/include tools/ch395cfg/src/telnetd.c target/telestrat/lib/ch395-8.lib -o target/telestrat/ch395cfg/telnetd
	$(CC) -ttelestrat -I src/include tools/ch395cfg/src/wget.c target/telestrat/lib/ch395-8.lib -o target/telestrat/ch395cfg/wget


docs:
	docs/builddocs.sh && cd docs && mkdocs build

clean:
	rm src/6502/*.o
	rm ch395-8.lib
	#rm tools/ch395cfg/*.o



