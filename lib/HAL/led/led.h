#ifndef _LED_H_
#define _LED_H_

#include "MemoryMap.h"
#include <stdint.h>

#ifdef LED_VEC


typedef struct {
  uint32_t data;    // data register         
  uint32_t config;  // configuration Register
} led_t;


class LedVector {

    private: volatile led_t* led;

    public: LedVector(uint32_t addr);
    public: LedVector(uint32_t addr, uint16_t init);
    public: ~LedVector();

    public: void turnOn();
    public: void turnOff();

    public: void set(uint16_t state);
    public: uint16_t inc();
    public: uint16_t shiftLeft();
    public: uint16_t shiftRight();
    public: uint16_t rotLeft();
    public: uint16_t rotRight();
};

#include "led.cpp"

#endif
#endif