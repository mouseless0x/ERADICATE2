CC=g++
CDEFINES=
SOURCES=Dispatcher.cpp eradicate2.cpp hexadecimal.cpp ModeFactory.cpp Speed.cpp sha3.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=ERADICATE2.x64

UNAME_S := $(shell uname -s)
UNAME_M := $(shell uname -m)

ifeq ($(UNAME_S),Darwin)
	LDFLAGS=-framework OpenCL -lcurl
	CFLAGS=-c -std=c++11 -Wall -O2
else
	ifeq ($(findstring x86,$(UNAME_M)),x86)
		LDFLAGS=-s -lOpenCL -lcurl -mcmodel=large
		CFLAGS=-c -std=c++11 -Wall -mmmx -O2 -mcmodel=large
	else
		LDFLAGS=-s -lOpenCL -lcurl
		CFLAGS=-c -std=c++11 -Wall -O2
	endif
endif

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $(CDEFINES) $< -o $@

clean:
	rm -rf *.o

