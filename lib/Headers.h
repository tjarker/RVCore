typedef struct {
  int status;  // 0x40020C00: The status register
  int config;  // 0x40020C04: The config register
  int   data;  // 0x40020C08: The data register  
} UART_t;
volatile UART_t* const UART0 = (UART_t*)0x40020C00

