/*============================================================================*/
/* UART */
enum uart
{
    UART_A,
    UART_B,
};

// 对应针脚为P3.3, P3.4
#define UART_A_CTL UCA0CTL1
#define UART_A_SEL P3SEL
#define UART_A_TXD BIT3
#define UART_A_RXD BIT4
#define UART_A_BR0 UCA0BR0
#define UART_A_BR1 UCA0BR1
#define UART_A_MCTL UCA0MCTL

// 对应针脚为P4.4, P4.5
#define UART_B_CTL UCA1CTL1
#define UART_B_SEL P4SEL
#define UART_B_TXD BIT4
#define UART_B_RXD BIT5
#define UART_B_BR0 UCA1BR0
#define UART_B_BR1 UCA1BR1
#define UART_B_MCTL UCA1MCTL

