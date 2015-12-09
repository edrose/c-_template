CC=g++
CFLAGS=-std=c++11 -g -Wall -Iinclude #Development flags for debugging
#CFLAGS=-std=c++11 -o3 -Wall -Werror -Iinclude #Production flags for optimisation
LFLAGS=-g
TARGET=list
CPP_FILES := $(wildcard src/*.cpp)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))


all: $(OBJ_FILES)
	$(CC) $(LFLAGS) -o bin/$(TARGET) obj/*.o

clean:
	rm obj/*.o
	rm bin/*

zip:
	mkdir $(TARGET)
	mkdir $(TARGET)/bin
	mkdir $(TARGET)/obj
	cp -r src $(TARGET)
	cp -r misc $(TARGET)
	cp -r include $(TARGET)
	cp README.txt $(TARGET)
	cp Makefile $(TARGET)
	zip -r $(TARGET).zip $(TARGET)
	rm -fr $(TARGET)

obj/%.o: src/%.cpp
	        $(CC) $(CFLAGS) -c -o $@ $<


