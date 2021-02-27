int getBtn(){
    int *btn = (int *)0x2300;
    return *btn;
}

void write7Seg(int c){
    int *seg = (int *)0x2000;
    *seg = c;
    return;
}

int main(){
    int i = 0;
    while(1){
        if(getBtn()){
            write7Seg(0xEEEE);
            for(i = 0; i < 8000000; i++){}
            write7Seg(0x0000);
        }
    }
    return 0;
}