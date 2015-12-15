
CFLAGS += -DFIXED_POINT -fPIC

KISS_DIR = kiss_fft

.PHONY: all clean $(KISS_DIR) install uninstall

all: $(KISS_DIR) libclap.so.$(LIB_VER)

$(KISS_DIR):
	$(MAKE) -C $(KISS_DIR)

libclap.so.$(LIB_VER): clap.o
	$(CC) $(CFLAGS) -shared -Wl,-soname,libclap.so.$(SO_VER) clap.o $(KISS_DIR)/kiss_fft_short.s $(LDFLAGS) -o libclap.so.$(LIB_VER)
	ln -fs libclap.so.$(LIB_VER) libclap.so.$(SO_VER)

clap.o: clap.c clap.h clap_in.h
	$(CC) $(CFLAGS) -c clap.c

clean:
	$(MAKE) -C $(KISS_DIR) clean
	rm -f *.o
	rm -f libclap.so.$(SO_VER)
	rm -f libclap.so.$(LIB_VER)
	rm -f *~*
	
install:
	cp -f clap.h $(PREFIX)/include
	cp -f libclap.so.$(LIB_VER) $(PREFIX)/lib
	ldconfig
	
uninstall:
	rm -f $(PREFIX)/include/clap.h
	rm -f $(PREFIX)/lib/libclap.so.$(LIB_VER)
	ldconfig