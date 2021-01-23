require 'test/unit'
require_relative '../generator'

class TestGenerator < Test::Unit::TestCase
  COMPONENTS = %i[@buttons @leds @ssignals @motor_driver @infrared_sensor].freeze

  def initialize(test_method_name)
    super
    @gen = Generator.new('gpio_config.json')
    @gen.parse
  end

  def test_parse_buttons
    assert_false(@gen.instance_eval { @buttons.nil? })
    buttons = @gen.instance_variable_get(:@buttons)
    button1, button2 = buttons

    assert(buttons.any?)
    assert_equal('BUTTON_A', button1.name)
    assert_equal('BUTTON_B', button2.name)
    assert_equal('P2.1', button1.pinout)
    assert_equal('P1.1', button2.pinout)
  end

  def test_parse_leds
    assert_false(@gen.instance_eval { @leds.nil? })
    leds = @gen.instance_variable_get(:@leds)
    led1, led2 = leds

    assert(leds.any?)
    assert_equal('LED_A', led1.name)
    assert_equal('LED_B', led2.name)
    assert_equal('P1.0', led1.pinout)
    assert_equal('P4.7', led2.pinout)
  end

  def test_parse_signals
    assert_false(@gen.instance_eval { @ssignals.nil? })
    pwms = @gen.instance_variable_get(:@ssignals)
    pwm1, pwm2 = pwms

    assert(pwms.any?)
    assert_equal('PWM_A', pwm1.name)
    assert_equal('PWM_B', pwm2.name)
    assert_equal('P1.4', pwm1.pinout)
    assert_equal('P1.5', pwm2.pinout)
  end

  def test_parse_infrared_sensor
    assert_false(@gen.instance_eval { @infrared_sensor.nil? })
    sensor = @gen.instance_variable_get(:@infrared_sensor)

    assert_equal('P6.4', sensor.l.pinout)
    assert_equal('P6.5', sensor.c.pinout)
    assert_equal('P6.6', sensor.r.pinout)
  end

  def test_parse_motor_driver
    assert_false(@gen.instance_eval { @motor_driver.nil? })
    driver = @gen.instance_variable_get(:@motor_driver)

    assert_equal('PWM_A', driver.en_x.name)
    assert_equal('PWM_B', driver.en_y.name)
    assert_equal('P1.4', driver.en_x.pinout)
    assert_equal('P1DIR', driver.en_x.dir)
    assert_equal('P1OUT', driver.en_x.out)
    assert_equal('BIT4', driver.en_x.port)
    assert_equal('P1.5', driver.en_y.pinout)
    assert_equal('P2.2', driver.in_a.pinout)
    assert_equal('P2.3', driver.in_b.pinout)
    assert_equal('P2.4', driver.in_c.pinout)
    assert_equal('P2.5', driver.in_d.pinout)
  end

  def test_buttons_gen
    remove_except(:@buttons)
    removed?(:@buttons)

    expected = File.read('tests/C_headers_for_tests/buttons.h')
    assert_equal(expected, @gen.result)
  end

  def test_leds_gen
    remove_except(:@leds)
    removed?(:@leds)

    expected = File.read('tests/C_headers_for_tests/leds.h')
    assert_equal(expected, @gen.result)
  end

  def test_signals_gen
    remove_except(:@ssignals)
    removed?(:@ssignals)

    expected = File.read('tests/C_headers_for_tests/signals.h')
    assert_equal(expected, @gen.result)
  end

  def test_motor_driver_gen
    remove_except(:@motor_driver, :@ssignals)
    removed?(:@motor_driver, :@ssignals)

    expected = File.read('tests/C_headers_for_tests/motor_driver.h')
    assert_equal(expected, @gen.result)
  end

  def test_infrared_sensor_gen
    remove_except(:@infrared_sensor)
    removed?(:@infrared_sensor)

    expected = File.read('tests/C_headers_for_tests/infrared_sensor.h')
    assert_equal(expected, @gen.result)
  end

  def test_combination
    expected = File.read('tests/C_headers_for_tests/gpio_config.h')
    assert_equal(expected, @gen.result)
  end

  def remove_except(*instance_variable)
    COMPONENTS
      .reject { |v| instance_variable.include?(v) }
      .each { |v| @gen.remove_instance_variable(v) }
  end

  def removed?(*except)
    except.all? { |e| assert_false(@gen.instance_eval { e.nil? }) } &&
      COMPONENTS.reject { |v| except.include?(v) }
                .all? { |v| assert(@gen.instance_eval { v.nil? }) }
  end
end