#define LED  (*(volatile unsigned char *)0x20800000)

#define GPBCON (*(volatile unsigned int *)0x56000010)
#define GPBDAT (*(volatile unsigned int *)0x56000014)
#define WTCON  (*(volatile unsigned int *)0x53000000)

void delay(void)
{
	int i;
	for(i =0;i < 10000;i++){}

	return;
}


int mymain(void)
{
	// GPBCON [1:0] 01 = Output
	GPBCON |= 1 <<0;
	GPBCON &= ~(1<<1);
	
	//GPB0 = 0
	GPBDAT &= ~(1<<0);

	//Reset enable/disable [0] 0: Disable the reset function of the watchdog timer.
	WTCON &= ~(1<<0);

	while(1)
	{
		LED = 0xff;	
		delay();
		LED = 0x00;
		delay();
	}

	return 0; 
}

