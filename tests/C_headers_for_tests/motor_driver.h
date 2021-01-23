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

