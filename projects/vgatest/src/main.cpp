#include "MemoryMap.h"
#include "vga.h"
#include "Keyboard.h"
#include <stdint.h>





int main(){
    
    VGADisplay vga(VGA);
    Keyboard key(KEYBOARD);

    uint16_t x = 0;
    uint16_t y = 1;
    vga.setBackground(0);
    vga.setForeground(2);
    vga.set(0,0,'T');
    vga.set(1,0,'e');
    vga.set(2,0,'s');
    vga.set(3,0,'t');
    vga.set(4,0,':');
    vga.setForeground(7);
    vga.setBackground(0);
    while(true){
        
        while(!key.hasChar()){
            //for(int i = 0; i < 1000; i++){}
        }
        vga.printBin(6,0,key.getError(),1);
        vga.printHex(x,y++,key.getChar(),2);
        y++;
        if(y >= 28){
            y = 1;
            x += 4;
        }
        if(x >= 76){
            vga.clearRectangle(0,1,80,30);
            y = 1;
            x = 0;
        }
        
        //for(int i = 0; i < 10000; i++){}
    }

}

/*
int main(){
    
    VGADisplay vga(VGA);

    uint16_t counter = 0;
    uint16_t x = 0;
    uint16_t y = 0;
    uint8_t fg = 0;
    uint8_t bg = 0;
    while(true){
        if(fg == bg){
            bg++;
        }
        vga.setForeground(fg);
        vga.setBackground(bg);
        vga.set(x,y,counter);
        counter++;
        if(counter >= 127){
            counter = 0;
        }
        if(counter == 50){
            fg++;
        }
        if(counter == 70){
            bg++;
        }
        x++;
        if(x >= 80){
            x = 0;
            y++;
        }
        if(y >= 30){
            y = 0;
        }
        for(int i = 0; i < 1000000; i++){}
    }

}

*/