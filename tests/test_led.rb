require 'test/unit'
require 'erb'
require_relative '../components/led'

class TestLED < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    @led1 = LED.new('LED_A', 'P1.0')
    @led2 = LED.new('LED_B', 'P4.7')
  end

  def test_name
    assert_equal('LED_A', @led1.name)
  end

  def test_attribute
    assert_equal('P1DIR', @led1.dir)
    assert_equal('P1OUT', @led1.out)
    assert_equal('BIT0', @led1.port)
  end

  def test_no_method
    assert_raise(NoMethodError) { @led1.in }
    assert_raise(NoMethodError) { @led1.sel }
    assert_raise(NoMethodError) { @led1.ren }
  end

  def test_template
    @leds = [@led1, @led2]
    template = File.read('component_templates/led.erb')
    gen = ERB.new(template, trim_mode: '-')
    expected = File.read('tests/C_headers_for_tests/leds.h')

    assert_equal(expected, gen.result(binding))
  end
end