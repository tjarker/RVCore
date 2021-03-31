#include "MemoryMap.h"
#include "vga.h"
#include <stdint.h>

int main(){
    
    VGADisplay vga(VGA);

    uint16_t counter = 0;
    while(true){
        vga.set(counter);
        counter += 1;
        for(int i = 0; i < 800000; i++){}
    }

}
