SOURCES8=$(wildcard src/6502/*.s)
OBJECTS8=$(SOURCES8:.s=.o)

SOURCES16=$(wildcard src/65c816/*.s)
OBJECTS16=$(SOURCES16:.s=.o)


all: $(SOURCES8) $(OBJECTS8) $(SOURCES16) $(OBJECTS16) samples

$(OBJECTS8): $(SOURCES8)
	ca65 -ttelestrat $(@:.o=.s) -o $@
	ar65 r ch395-8:.lib  $@

$(OBJECTS16): $(SOURCES16)
	ca65 -ttelestrat $(@:.o=.s) -o $@
	ar65 r ch395-16.lib  $@


samples: 
	cl65 -ttelestrat -I include samples/displayHrs.c

clean:
	rm src/6502/*.o
	rm src/65c816/*.o
	rm samples/*.o
	rm SDL.lib


