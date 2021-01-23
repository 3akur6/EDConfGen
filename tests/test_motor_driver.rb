require 'test/unit'
require 'erb'
require_relative '../components/motor_driver'
require_relative '../components/ssignal'

class TestMotorDriver < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    signal_a_pinouts = {
      'EN' => { 'EN_X' => 'P1.4' }, 'IN' => { 'IN_A' => 'P2.2', 'IN_B' => 'P2.3' }
    }
    signal_b_pinouts = {
      'EN' => { 'EN_Y' => 'P1.5' }, 'IN' => { 'IN_C' => 'P2.4', 'IN_D' => 'P2.5' }
    }
    signals = {
      'SIGNAL_A' => Ssignal.new('PWM_A', signal_a_pinouts['EN']['EN_X'], 'PWM').unwrap,
      'SIGNAL_B' => Ssignal.new('PWM_B', signal_b_pinouts['EN']['EN_Y'], 'PWM').unwrap
    }
    @motor_driver = MotorDriver.new(
      'MOTOR_DRIVER_A',
      { 'SIGNAL_A' => signal_a_pinouts['IN'], 'SIGNAL_B' => signal_b_pinouts['IN'] },
      signals
    )
  end

  def test_name
    assert_equal('PWM_A', @motor_driver.en_x.name)
    assert_equal('PWM_B', @motor_driver.en_y.name)
  end

  def test_attribute
    assert_equal('P1DIR', @motor_driver.en_x.dir)
    assert_equal('P1OUT', @motor_driver.en_x.out)
    assert_equal('BIT4', @motor_driver.en_x.port)

    assert_equal('P1DIR', @motor_driver.en_y.dir)
    assert_equal('P1OUT', @motor_driver.en_y.out)
    assert_equal('BIT5', @motor_driver.en_y.port)

    assert_equal('P2DIR', @motor_driver.in_a.dir)
    assert_equal('P2OUT', @motor_driver.in_a.out)
    assert_equal('BIT2', @motor_driver.in_a.port)

    assert_equal('P2DIR', @motor_driver.in_b.dir)
    assert_equal('P2OUT', @motor_driver.in_b.out)
    assert_equal('BIT3', @motor_driver.in_b.port)
  end

  def test_no_method
    assert_raise(NoMethodError) { @motor_driver.dir }
    assert_raise(NoMethodError) { @motor_driver.port }
    assert_raise(NoMethodError) { @motor_driver.in }
    assert_raise(NoMethodError) { @motor_driver.out }
    assert_raise(NoMethodError) { @motor_driver.ren }
    assert_raise(NoMethodError) { @motor_driver.sel }
  end

  def _test_template
    template = File.read('component_templates/motor_driver.erb')
    gen = ERB.new(template, trim_mode: '-')
    expected = File.read('tests/C_headers_for_tests/motor_driver.h')

    assert_equal(expected, gen.result(binding))
  end
end
