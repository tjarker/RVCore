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
	int counter = 1, i = 0;
	while(1){
		updateLed(counter);
		updateSev(counter);
		counter = counter << 1;
		if(counter == 1<<16){
			counter = 1;
		}
		for(i = 0; i < 8000000; i++){}
	}
	return 0;
}
	
