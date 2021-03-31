#include "MemoryMap.h"
#include "led.h"
#include "sevenseg.h"
#include <stdint.h>

int main(){
    
    LedVector led(LED_VEC, 0x01);
    SevenSegmentDisplay sev(SEVEN_SEGMENT_DISPLAY);

    while(true){
        led.rotLeft();
        sev.inc();
        for(int i = 0; i < 8000000; i++){}
    }

}
