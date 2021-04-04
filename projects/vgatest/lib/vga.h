#ifndef _VGA_H_
#define _VGA_H_

#include "MemoryMap.h"
#include <stdint.h>

#ifdef VGA


typedef struct {
  volatile uint32_t data[32*80];    // data register         
} vga_t;


class VGADisplay {

    private: volatile vga_t* vga;
    private: uint16_t fg = 7;
    private: uint16_t bg = 0;

    public: VGADisplay(uint32_t addr){
        vga = (vga_t*) addr;

    }
    public: ~VGADisplay(){

    }
    public: void set(uint16_t x, uint16_t y, uint8_t state) {
      vga->data[y|(x<<5)] = (bg<<(8+3)) | (fg<<8) | state;
    }
    public: void printBin(uint16_t x, uint16_t y, uint16_t num, uint8_t n){
      for(uint32_t i = 0; i < n; i++){
        set(x++, y, (num & (1<<(n-1-i))) ? 0x31 : 0x30);
      }
    }
    public: void printHex(uint16_t x, uint16_t y, uint32_t num, uint8_t n){
      for(uint32_t i = 0; i < n; i++){
        uint8_t field = (num >> ((n-1-i)<<2)) & 0x0000000FL;
        uint8_t ch = field + ((field < 10) ? 0x30 : (0x40-9));
        set(x++, y, ch);
      }
    }
    public: void print(uint16_t x, uint16_t y, const char* str){
      while(*str != '\0'){
        set(x++, y, *(str++));
      }
    }
    public: void setForeground(uint16_t color) {
      this->fg = color;
    }
    public: void setBackground(uint16_t color) {
      this->bg = color;
    }
    public: void clearRectangle(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1){
      for(uint16_t x = x0; x < x1; x++){
        for(uint16_t y = y0; y < y1; y++){
          set(x,y,0);
        }
      }
    }


};

#endif
#endif