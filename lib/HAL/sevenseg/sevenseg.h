#ifndef _SEVENSEG_H_
#define _SEVENSEG_H_

#include "MemoryMap.h"
#include <stdint.h>

#ifdef SEVEN_SEGMENT_DISPLAY


typedef struct {
  volatile uint32_t data;    // data register         
  volatile uint32_t config;  // configuration Register
} sevenSeg_t;


class SevenSegmentDisplay {

    private: volatile sevenSeg_t* sevseg;

    public: SevenSegmentDisplay(uint32_t addr){
        sevseg = (sevenSeg_t*) addr;
        set(0);
        turnOn();
    }
    public: SevenSegmentDisplay(uint32_t addr, uint16_t init){
        sevseg = (sevenSeg_t*) addr;
        set(init);
        turnOn();
    }
    public: ~SevenSegmentDisplay(){
        set(0);
        turnOff();
    }

    public: void turnOn(){
        sevseg->config |= 0x01;
    }
    public: void turnOff(){
        sevseg->config &= ~0x01;
    }

    public: void set(uint16_t state){
        sevseg->data = state;
    }
    public: uint16_t inc(){
        sevseg->data++;
        return sevseg->data;
    }
    public: uint16_t dec(){
        sevseg->data--;
        return sevseg->data;
    }
};

#endif
#endif