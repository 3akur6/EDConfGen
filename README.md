## EDConfGen

C Header (definitions of GPIO) Generator for [EDLab repo](https://github.com/3akur6/EDLab), making GPIO setting and
changing easier

thanks to ruby **erb**, a powerful templating engine

Description
-----------

Edit the [gpio_config.json](./gpio_config.json) and the generator will make it into a C header which is basically and
globally used in EDLab repo.

The main template is [gpio_config_template.erb](./gpio_config_template.erb), consisting of other component templates
in [component_templates](./component_templates) directory.

Each component is combined with a ruby class, which defined its PxIN, PxOUT, PxDIR and so on, used for parsing template.

All means you can add a new component or modify the output format with ease.

Usage
-----

```
usage: ./main.rb [options]
    -c, --config  configuration file (json only)
    -o, --output  C header file name generated (default: gpio_config.h)
```

### Config File

```json5
{
  "buttons": {          // plugin type --> components/button.rb, component_templates/button.erb
    "BUTTON_A": "P2.1", // plugin name: pinout in chip --> enum button BUTTON_A
    "BUTTON_B": "P1.1"  // ------------------------------> enum button BUTTON_B
  },
  "leds": {          // plugin type --> components/led.rb, component_templates/led.erb
    "LED_A": "P1.0", // ---------------------------------> enum led LED_A
    "LED_B": "P4.7"  // ---------------------------------> enum led LED_B
  },
  "pwms": {
    "PWM_A": "P1.4", // <----------|
    "PWM_B": "P1.5"  // <----------|--|
  },                 //            |  |
  "motor_driver": {  //            |  |
    "left": {        //            |  |
      "enable_signal": { //        |  |
        "EN_A": "PWM_A"  // -------|  |
      },                   //         |
      "control_pinouts": { //         |
        "IN_A": "P2.2",    //         |
        "IN_B": "P2.3"     //         |
      }                    //         |
    },                     //         |
    "right": {             //         |
      "enable_signal": { //           |
        "EN_B": "PWM_B"  // ----------|
      },
      "control_pinouts": {
        "IN_C": "P2.4",
        "IN_D": "P2.5"
      }
    }
  },
  "infrared_sensor": {
    "L": "P6.4",
    "C": "P6.5",
    "R": "P6.6"
  },
  "relays": {
    "RELAY": "P1.3"
  }, 
  "mos": {
    "MOS": "P2.7"
  },
  "uarts": {
    "UART_A": {
      "TXD": "P3.3",
      "RXD": "P3.4"
    },
    "UART_B": {
      "TXD": "P4.4",
      "RXD": "P4.5"
    }
  }
}
```

### Notes

1) Pinouts assigned in config won't be checked in this generator. Make sure they are correctly set.
2) Buttons and leds are reserved in pinouts, mapped to P2.1, P1.1, P1.0 and P4.7 in msp430f5529. Never change them if
   using msp430f5529.
