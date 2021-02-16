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
    /*for(i = 0; i < 5000000; i++){

	}*/
    write7Seg(0x0000);
    while(1){
        write7Seg(hasChar());
        for(i = 0; i < 6000000; i++){

	    }
    }
    return 0;
}