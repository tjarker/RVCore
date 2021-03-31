#ifndef _VGA_H_
#define _VGA_H_

#include "MemoryMap.h"
#include <stdint.h>

#ifdef VGA


typedef struct {
  volatile uint32_t data;    // data register         
} vga_t;


class VGADisplay {

    private: volatile vga_t* vga;

    public: VGADisplay(uint32_t addr){
        vga = (vga_t*) addr;

    }
    public: ~VGADisplay(){

    }
    public: void set(uint16_t state) {
      vga->data = state;
    }


};

#endif
#endif