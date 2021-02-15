int main(){
	int counter = 0;
	int *LED = (int *)0x2000;
	while(1){
		counter++;
		*LED = counter;
	}
	return 0;
}
	
