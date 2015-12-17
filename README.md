# libclap

libclap - A Simple way to detect hand claps in Python for Linux

## Features

* Implements radix-2 algorithm
* Works on fixed-point (interger) data
* Performs in-place algorithm - input buffer is used as output buffer
* Core FFT part written in ARM assembly (using ARM EABI interface)
* Licensed under GPLv2
* Distributed as source code

## Abstract

The library is easy to use and flexible in configuration. The definition of action that is invoked on clap detection time is up to application side, not library. To use the library in your application include the header file: #include<clap.h> and instruct linker to use shared library file at linking stage using -lclap gcc flag. In your application call the following function when you want detection process to begin:
`struct clap_cfg *clap_init(char *s_card, void (*clap_func)(void), int sens);`

* `s_card` - string specifying sound card on which detection will be carried out, in Alsa format e.g. "**hw:0,0**".
* `clap_func` - pointer to function which will be invoked every time library detects a clap.
* `sens` - must be number greater than 0, specifies sensitivity of detection process - the greater number you pass, the less sensitive library will be. Adjust that number according to your enviroment. 10 is good value to start tuning with.

The function returns pointer values which must be stored by the application and used when stopping the detection process. Thanks to the pointer distinction, the application may call an init function multiple times for distinct sound cards and perform many detection processes simultaneously.

To stop detection process and deallocate all resources used by it, call following function: `void clap_free(struct clap_cfg cfg);`
* `cfg` - pointer which was previously returned by init function.

## Interface

Transform accepts samples in following format:

```
struct ff_arm_cmx {ldelim}
  int16_t re;
  int16_t im;
{rdelim};
```
To initialize algorithm call following function:
struct ff_arm_cfg* ff_arm_init(int llog);

* `llog` - logarithm to base 2 of transform size. Final transform size is equal to 2^llog. Minimal accepted value of this parameter is 2, maximal 16, so transform varies in length from 4 to 65536

Actual transform is carried out by function:
void ff_arm_t(struct ff_arm_cfg* cfg, struct ff_arm_cmx* samples);

* `cfg` - pointer which was previously returned by init function.
    samples - pointer to sample buffer. Buffer should store 2^llog elements of type struct ff_arm_cmx.

When function returns transform result is stored in samples buffer - algorithm runs in-place.

To deallocate all resources used by algorithm call following function:
void ff_arm_exit(struct ff_arm_cfg* cfg);

* `cfg` - pointer which was previously returned by init function

### Speed-up

FF-ARM does reverse-binary reindexing on input buffer in order to run algorithm in-place. It is possible to speed-up this step by making use of look-up table. Drawback of this method is greater memory usage - look-up table consumes 2^(llog + 1) bytes of memory. If you decide to use look-up table to perfrom reindexing, compile FF-ARM sources with RINDEX_LOOKUP macro defined (e.g. use -DRINDEX_LOOKUP parameter when invoking gcc). Look-up table option is disabled by default.
Download

## Installation

* Clone the git to a folder.
* Enter the folder `cd libclap/`
* Install `libasound2-dev` with `sudo apt-get install libasound2-dev`
* Install `wiringPi` with `sudo apt-get install wiringPi`
* Make and install. `make && sudo make install`
* You're done !
* *If you want a sample app, run `make pinclap`*

For information about compilation, installation and usage look at
<http://lukaszczyz.pl/?p=clap>

## Sample application

<https://www.youtube.com/watch?v=MFdgDUboMqE>

In the source tarball, you can also find pinclap - a sample application that uses this library. Its operation is presented in the video included. It toggles Raspberry Pi GPIO pin when it detects a double clap. You can find it in the pinclap subdirectory.

Note that you need to install `wiringPi` library to compile and run this application.

## Contact

**Original Author:** Lukasz Czyz  
**E-mail:** lukasz.czyzz@gmail.com
