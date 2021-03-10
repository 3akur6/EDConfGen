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

