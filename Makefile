SOURCES8=$(wildcard src/6502/*.s)
OBJECTS8=$(SOURCES8:.s=.o)

#SOURCES16=$(wildcard src/65c816/*.s)
#OBJECTS16=$(SOURCES16:.s=.o)


all: tool $(SOURCES8) $(OBJECTS8)

$(OBJECTS8): $(SOURCES8)
	mkdir target/telestrat/lib/ -p
	@ca65 -ttelestrat $(@:.o=.s) -o $@ --include-dir src/include
	@ar65 r ch395-8.lib  $@
	cp ch395-8.lib target/telestrat/lib/

tool: 
	mkdir -p target/telestrat/ch395cfg/
	cl65 -ttelestrat -I src/include tools/ch395cfg/src/main.c target/telestrat/lib/ch395-8.lib -o target/telestrat/ch395cfg/ch395cfg

clean:
	rm src/6502/*.o
	rm tools/ch395cfg/*.o
	rm ch395-8.lib


