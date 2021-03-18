#include "modules.h"

int main(){
    int i = 0, count = 0;

    led->config = 1;

    for(;;){
        count++;
        if(count > 0xFFFFFFFF)
            count = 0;
        led->data = count;
        for(i = 0; i < 8000000; i++){}
    }

}
