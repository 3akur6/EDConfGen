require 'test/unit'
require 'erb'
require_relative '../components/ssignal'

class TestPwm < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    @ssignal1 = Ssignal.new('PWM_A', 'P1.4', 'PWM')
    @ssignal2 = Ssignal.new('PWM_B', 'P1.5', 'PWM')
    @pwm1 = @ssignal1.unwrap
    @pwm2 = @ssignal2.unwrap
  end

  def test_name
    assert_equal('TIMER_A', @pwm1.timer.name)
    assert_equal('PWM_A', @pwm1.name)

    assert_equal('TIMER_B', @pwm2.timer.name)
    assert_equal('PWM_B', @pwm2.name)
  end

  def test_attribute
    assert_equal('TA0CTL', @pwm1.timer.ctl)
    assert_equal('MC_1', @pwm1.timer.mc)
    assert_equal('TASSEL_2', @pwm1.timer.ssel)
    assert_equal('TA0CCR0', @pwm1.timer.ceiling)

    assert_equal('P1DIR', @pwm1.dir)
    assert_equal('P1SEL', @pwm1.sel)
    assert_equal('BIT4', @pwm1.port)
    assert_equal('TA0CCTL3', @pwm1.ctl)
    assert_equal('TA0CCR3', @pwm1.ceiling)
    assert_equal('OUTMOD_7', @pwm1.outmod)


    assert_equal('TA0CTL', @pwm2.timer.ctl)
    assert_equal('MC_1', @pwm2.timer.mc)
    assert_equal('TASSEL_2', @pwm2.timer.ssel)
    assert_equal('TA0CCR0', @pwm2.timer.ceiling)

    assert_equal('P1DIR', @pwm2.dir)
    assert_equal('P1SEL', @pwm2.sel)
    assert_equal('BIT5', @pwm2.port)
    assert_equal('TA0CCTL4', @pwm2.ctl)
    assert_equal('TA0CCR4', @pwm2.ceiling)
    assert_equal('OUTMOD_7', @pwm2.outmod)
  end

  def test_no_method
    assert_raise(NoMethodError) { @pwm1.timer.dir }
    assert_raise(NoMethodError) { @pwm1.timer.in }
    assert_raise(NoMethodError) { @pwm1.timer.out }
    assert_raise(NoMethodError) { @pwm1.timer.sel }
    assert_raise(NoMethodError) { @pwm1.timer.ren }

    assert_raise(NoMethodError) { @pwm1.in }
    assert_raise(NoMethodError) { @pwm1.ren }
  end

  def test_template
    @ssignals = [@ssignal1, @ssignal2]
    template = File.read('component_templates/pwm.erb')
    gen = ERB.new(template, trim_mode: '-')
    expected = File.read('tests/C_headers_for_tests/signals.h')

    assert_equal(expected, gen.result(binding))
  end
end