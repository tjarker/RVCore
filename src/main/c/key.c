int getChar(){
    int *charBuffer = (int *)0x2200;
    return *charBuffer;
}

int hasChar(){
    int *charFlag = (int *)0x2100;
    return *charFlag;
}

void write7Seg(int c){
    int *seg = (int *)0x2000;
    *seg = c;
    return;
}

int main(){
    int i = 0;
    write7Seg(0xBEEF);
    for(i = 0; i < 8000000; i++){}
    write7Seg(0x0000);
    while(1){
        if(hasChar()){
            write7Seg(getChar());
            for(i = 0; i < 9000000; i++){}
            write7Seg(0x0000);
        }
    }
    return 0;
}