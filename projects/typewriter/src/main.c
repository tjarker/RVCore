#include "modules.h"

int main(){
    int count = 0;

    led->config = 1;

    for(;;){
        count++;
        if(count > 0xFFFFFFFF)
            count = 0;
        led->data = count;
    }

}
