#include "MemoryMap.h"
#include "led.h"
#include <stdint.h>

int main(){
    
    LedVector led(LED_VEC, 0x01);

    while(true){
        led.rotLeft();
        for(int i = 0; i < 8000000; i++){}
    }

}
