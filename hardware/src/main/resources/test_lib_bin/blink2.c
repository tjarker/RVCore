void updateLED(int counter){
	int *LED = (int *)0x2000;
	*LED = counter;
	return;
}

int main(){
	int counter = 1<<15, i =0;
	
	while(1){
		counter = counter << 1;
		if(counter == 0){
			counter = 1<<15;
		}
		updateLED(counter);
		for(i = 0; i < 5000000; i++){

		}
	}
	return 0;
}
	
