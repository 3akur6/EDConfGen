/*============================================================================*/
/* 单片机按钮 */
enum button
{
    BUTTON_A,
    BUTTON_B,
};

// 对应针脚为P2.1
#define BUTTON_A_DIR P2DIR
#define BUTTON_A_IN P2IN
#define BUTTON_A_PORT BIT1
#define BUTTON_A_REN P2REN
#define BUTTON_A_OUT P2OUT

// 对应针脚为P1.1
#define BUTTON_B_DIR P1DIR
#define BUTTON_B_IN P1IN
#define BUTTON_B_PORT BIT1
#define BUTTON_B_REN P1REN
#define BUTTON_B_OUT P1OUT

/*============================================================================*/
/* 单片机指示灯 */
enum led
{
    LED_A,
    LED_B,
};

// 对应针脚为P1.0
#define LED_A_DIR P1DIR
#define LED_A_OUT P1OUT
#define LED_A_PORT BIT0

// 对应针脚为P4.7
#define LED_B_DIR P4DIR
#define LED_B_OUT P4OUT
#define LED_B_PORT BIT7

/*============================================================================*/
/* 单片机PWM信号 */
enum pwm
{
    PWM_A,
    PWM_B,
};

#define TIMER_A_CTL TA0CTL      // 时钟控制器
#define TIMER_A_MC MC_1         // 时钟计数模式选择UP
#define TIMER_A_SSEL TASSEL_2   // 时钟源选择SMCLK
#define TIMER_A_CEILING TA0CCR0 // 第一计时器
#define PWM_A_DIR P1DIR
#define PWM_A_SEL P1SEL         // 输出口功能位
#define PWM_A_PORT BIT4
#define PWM_A_CTL TA0CCTL3      // 控制器
#define PWM_A_CEILING TA0CCR3   // 第二计时器
#define PWM_A_OUTMOD OUTMOD_7   // 时钟跳变模式

#define TIMER_B_CTL TA0CTL      // 时钟控制器
#define TIMER_B_MC MC_1         // 时钟计数模式选择UP
#define TIMER_B_SSEL TASSEL_2   // 时钟源选择SMCLK
#define TIMER_B_CEILING TA0CCR0 // 第一计时器
#define PWM_B_DIR P1DIR
#define PWM_B_SEL P1SEL         // 输出口功能位
#define PWM_B_PORT BIT5
#define PWM_B_CTL TA0CCTL4      // 控制器
#define PWM_B_CEILING TA0CCR4   // 第二计时器
#define PWM_B_OUTMOD OUTMOD_7   // 时钟跳变模式

/*============================================================================*/
/* 电机驱动模块 */
enum common
{
    CMN_A,
    CMN_B,
};

enum signal
{
    SIGNAL_A,
    SIGNAL_B,
};

// 使能端口X（若使用PWM信号，须与PWM输出端口设置保持一致）
#define EN_X_DIR P1DIR
#define EN_X_PIN P1OUT
#define EN_X_PORT BIT4

// 使能端口Y（若使用PWM信号，须与PWM输出端口设置保持一致）
#define EN_Y_DIR P1DIR
#define EN_Y_PIN P1OUT
#define EN_Y_PORT BIT5

// 输出口A、B（逻辑电平，控制电机状态）
#define IN_A_DIR P2DIR
#define IN_A_PIN P2OUT
#define IN_A_PORT BIT2
#define IN_B_DIR P2DIR
#define IN_B_PIN P2OUT
#define IN_B_PORT BIT3

// 输出口C、D（逻辑电平，控制电机状态）
#define IN_C_DIR P2DIR
#define IN_C_PIN P2OUT
#define IN_C_PORT BIT4
#define IN_D_DIR P2DIR
#define IN_D_PIN P2OUT
#define IN_D_PORT BIT5

/*============================================================================*/
/* 红外光电模块 */
// L引脚接P6.4
// C引脚接P6.5
// R引脚接P6.6
#define L_DIR P6DIR
#define L_REN P6REN
#define L_OUT P6OUT
#define L_PIN P6IN
#define L_PORT BIT4
#define C_DIR P6DIR
#define C_REN P6REN
#define C_OUT P6OUT
#define C_PIN P6IN
#define C_PORT BIT5
#define R_DIR P6DIR
#define R_REN P6REN
#define R_OUT P6OUT
#define R_PIN P6IN
#define R_PORT BIT6

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

/*============================================================================*/
/* 继电器模块 */
// 对应针脚为P1.3
#define RELAY_DIR P1DIR
#define RELAY_OUT P1OUT
#define RELAY_PORT BIT3

