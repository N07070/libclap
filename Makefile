
PREFIX = /usr/local
LIB_DIR = lib
APP_DIR = pinclap
CFLAGS += -O3

# flags used for cross-compilation
#CFLAGS += -Wall -I$(HOME)/rpi/usr/include -I$(HOME)/rpi/usr/local/include
#CC = arm-unknown-linux-gnueabi-gcc

PACKAGE_VER = 0.8
MIN_VER = 0.0
SO_VER  = 0
LIB_VER = $(SO_VER).$(MIN_VER)

export PREFIX
export CC
export CFLAGS
export LDFLAGS
export SO_VER
export LIB_VER


.PHONY: $(LIB_DIR) $(APP_DIR) install uninstall dist


$(LIB_DIR):
	$(MAKE) -C $(LIB_DIR)
	
$(APP_DIR):
	$(MAKE) -C $(APP_DIR)
	
install:
	$(MAKE) -C $(LIB_DIR) install
	
uninstall:
	$(MAKE) -C $(LIB_DIR) uninstall
	
clean:
	rm -f *.tar.gz
	rm -f *~*
	$(MAKE) -C $(APP_DIR) clean
	$(MAKE) -C $(LIB_DIR) clean
	
dist:
	cd .. && tar --exclude=.svn -czf clap-$(PACKAGE_VER).tar.gz clap
	mv ../clap-$(PACKAGE_VER).tar.gz .