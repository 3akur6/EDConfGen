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

