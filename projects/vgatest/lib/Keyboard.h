#ifndef _KEYBOARD_H_
#define _KEYBOARD_H_

#include "MemoryMap.h"
#include <stdint.h>

#ifdef KEYBOARD

void memset(void *str, uint8_t c, uint32_t n){
    uint8_t *ptr = (uint8_t*) str;
    for(uint32_t i = 0; i < n; i++) {
        ptr[i] = c;
    }
}

typedef struct {
  volatile uint32_t status;
  volatile uint32_t data; 
  volatile uint32_t counter;
  volatile uint32_t shift;
} key_t;


class Keyboard {

    private: volatile key_t* key;
    private: bool wasRelease = false;
    private: bool wasExtended = false;
    private: bool hasNewChar = false;
    private: uint8_t lastChar = 0;

    public: Keyboard(uint32_t addr){
        key = (key_t*) addr;
    }
    public: ~Keyboard(){

    }
    public: bool hasChar(){
        if(hasNewCode()){
            uint8_t code = getNewCode();
            if(code == 0xF0){
                wasRelease = true;
            } else if(code == 0xE0){
                wasExtended = true;
            } else {
                if(wasRelease){
                    wasRelease = false;
                } else if(wasExtended){
                    wasExtended = false;
                } else {
                    lastChar = code;
                    hasNewChar = true;
                } 
            }
        }
        return hasNewChar;
    }
    private: bool hasNewCode() {
        return key->status & 0x01;
    }
    private: uint8_t getNewCode() {
        uint8_t code = key->data;
        signalRead();
        return code;
    }
    public: uint8_t getChar() {
        hasNewChar = false;
        return lastChar;
    }
    private: void signalRead() {
        key->status |= 0x02;
    }
    public: uint8_t getCounter(){
        return key->counter;
    }
    public: uint16_t getShiftState(){
        return key->shift;
    }
    public: bool getError(){
        return key->status & (1<<2);
    }

    private: static const uint8_t code2Char[0x90];

};

const uint8_t Keyboard::code2Char[] = {
        0x00, // 0x00 = none
        0x00, // 0x01 = F9
        0x00, // 0x02 = none
        0x00, // 0x03 = F5
        0x00, // 0x04 = F3
        0x00, // 0x05 = F1
        0x00, // 0x06 = F2
        0x00, // 0x07 = F12
        0x00, // 0x08 = none
        0x00, // 0x09 = none
        0x00, // 0x0A = none
        0x00, // 0x0B = none
        0x00, // 0x0C = none
        0x00, // 0x0D = none
        0x00, // 0x0E = none
        0x00, // 0x0F = none

        0x00, // 0x10 = none
        0x00, // 0x11 = none
        0x00, // 0x12 = none
        0x00, // 0x13 = none
        0x00, // 0x14 = none
        0x00, // 0x15 = none
        0x31, // 0x16 = 1
        0x00, // 0x17 = none
        0x00, // 0x18 = none
        0x00, // 0x19 = none
        0x00, // 0x1A = none
        0x00, // 0x1B = none
        0x00, // 0x1C = none
        0x00, // 0x1D = none
        0x32, // 0x1E = 2
        0x00, // 0x1F = none

        0x00, // 0x20 = none
        0x00, // 0x21 = none
        0x00, // 0x22 = none
        0x00, // 0x23 = none
        0x00, // 0x24 = none
        0x34, // 0x25 = 4
        0x33, // 0x26 = 3
        0x00, // 0x27 = none
        0x00, // 0x28 = none
        0x00, // 0x29 = none
        0x00, // 0x2A = none
        0x00, // 0x2B = none
        0x00, // 0x2C = none
        0x00, // 0x2D = none
        0x35, // 0x2E = 5
        0x00, // 0x2F = none

        0x00, // 0x30 = none
        0x00, // 0x31 = none
        0x00, // 0x32 = none
        0x00, // 0x33 = none
        0x00, // 0x34 = none
        0x00, // 0x35 = none
        0x36, // 0x36 = 6
        0x00, // 0x37 = none
        0x00, // 0x38 = none
        0x00, // 0x39 = none
        0x00, // 0x3A = none
        0x00, // 0x3B = none
        0x00, // 0x3C = none
        0x37, // 0x3D = 7
        0x38, // 0x3E = 8
        0x00, // 0x3F = none

        0x00, // 0x40 = none
        0x00, // 0x41 = none
        0x00, // 0x42 = none
        0x00, // 0x43 = none
        0x00, // 0x44 = none
        0x30, // 0x45 = 0
        0x39, // 0x46 = 9
        0x00, // 0x47 = none
        0x00, // 0x48 = none
        0x00, // 0x49 = none
        0x00, // 0x4A = none
        0x00, // 0x4B = none
        0x00, // 0x4C = none
        0x00, // 0x4D = none
        0x2d, // 0x4E = -
        0x00, // 0x4F = none

        0x00, // 0x50 = none
        0x00, // 0x51 = none
        0x00, // 0x52 = none
        0x00, // 0x53 = none
        0x00, // 0x54 = none
        0x3d, // 0x55 = =
        0x00, // 0x56 = none
        0x00, // 0x57 = none
        0x00, // 0x58 = none
        0x00, // 0x59 = none
        0x00, // 0x5A = none
        0x00, // 0x5B = none
        0x00, // 0x5C = none
        0x00, // 0x5D = none
        0x00, // 0x5E = none
        0x00, // 0x5F = none

        0x00, // 0x60 = none
        0x00, // 0x61 = none
        0x00, // 0x62 = none
        0x00, // 0x63 = none
        0x00, // 0x64 = none
        0x00, // 0x65 = none
        0x1b, // 0x66 = backspace
        0x00, // 0x67 = none
        0x00, // 0x68 = none
        0x00, // 0x69 = none
        0x00, // 0x6A = none
        0x00, // 0x6B = none
        0x00, // 0x6C = none
        0x00, // 0x6D = none
        0x00, // 0x6E = none
        0x00, // 0x6F = none

        0x00, // 0x70 = none
        0x00, // 0x71 = none
        0x00, // 0x72 = none
        0x00, // 0x73 = none
        0x00, // 0x74 = none
        0x00, // 0x75 = none
        0x1E, // 0x76 = ESC
        0x00, // 0x77 = none
        0x00, // 0x78 = none
        0x00, // 0x79 = none
        0x00, // 0x7A = none
        0x00, // 0x7B = none
        0x00, // 0x7C = none
        0x00, // 0x7D = none
        0x00, // 0x7E = none
        0x00, // 0x7F = none

        0x00, // 0x80 = none
        0x00, // 0x81 = none
        0x00, // 0x82 = none
        0x00, // 0x83 = none
        0x00, // 0x84 = none
        0x00, // 0x85 = none
        0x00, // 0x86 = none
        0x00, // 0x87 = none
        0x00, // 0x88 = none
        0x00, // 0x89 = none
        0x00, // 0x8A = none
        0x00, // 0x8B = none
        0x00, // 0x8C = none
        0x00, // 0x8D = none
        0x00, // 0x8E = none
        0x00, // 0x8F = none
    };

#endif
#endif