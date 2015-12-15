KFVER=130
CFLAGS += -O3 -ffast-math -fomit-frame-pointer -dA -fverbose-asm -S

.PHONY: clean

kiss_fft_short.s: kiss_fft.c kiss_fft.h _kiss_fft_guts.h
	$(CC) $(CFLAGS) -o kiss_fft_short.s kiss_fft.c 

clean:
	rm -f kiss_fft_short.s
	rm -f *.o
	rm -f *~*