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

