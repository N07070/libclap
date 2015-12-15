
CFLAGS += -I../lib

# flag used for cross-compilation
#LDFLAGS += -L$(HOME)/rpi/usr/local/lib -L$(HOME)/rpi/usr/lib/arm-linux-gnueabihf

LDFLAGS += -lm -lasound -lrt -lwiringPi

.PHONY: all

all: pinclap

pinclap : main.o loc_time.o
	$(CC) $(CFLAGS) loc_time.o main.o $(LDFLAGS) ../lib/libclap.so.$(LIB_VER) -o pinclap

main.o: main.c
	$(CC) -c $(CFLAGS) main.c
	
loc_time.o: loc_time.c loc_time.h
	$(CC) -c $(CFLAGS) loc_time.c
	
clean:
	rm -f *.o
	rm -f pinclap
	rm -f *~*