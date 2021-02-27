int getChar(){
    volatile int *charBuffer = (int *)0x2208;
    return *charBuffer;
}

int getActive(){
    volatile int *config = (int *)0x2204;
    return *config & 0x01;
}

int hasChar(){
    volatile int *status = (int *)0x2200;
    return *status & 0x01;
}

void updateSev(int counter){
	volatile int *sev = (int *) 0x2100;
	*sev = counter;
	return;
}

void updateLed(int counter){
	volatile int *led = (int *) 0x2000;
	*led = counter;
	return;
}

int main(){
    int v = 0, out = 0, i = 0, j = 0;
    
    v = getActive();
    updateLed(v);
    for(i = 0; i < 40000000; i++){}
    v = 0;
    updateLed(v);
    for(i = 0; i < 80000; i++){}

    while(1){
        v = 0;
        v = hasChar()<<1;
        updateLed(v);

        if(v==2){
            out = getChar();
            updateSev(out);
            for(i = 0; i < 40000000; i++){
                v = (hasChar()<<1) | 0x8000;
                updateLed(v);
                for(j = 0; j < 800; j++){}
            }
            out = 0;
            updateSev(out);
        }
        for(i = 0; i < 800; i++){}
    }


    return 0;
}