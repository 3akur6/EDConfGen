require 'test/unit'
require 'erb'
require_relative '../components/infrared_sensor'

class TestInfraredSensor < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    pinouts = {
      'L' => 'P6.4',
      'C' => 'P6.5',
      'R' => 'P6.6'
    }
    @sensor = InfraredSensor.new('INFRARED_SENSOR_A', pinouts)
  end

  def test_attribute
    assert_equal('P6.4', @sensor.l.pinout)
    assert_equal('P6DIR', @sensor.l.dir)
    assert_equal('P6REN', @sensor.l.ren)
    assert_equal('P6OUT', @sensor.l.out)
    assert_equal('P6IN', @sensor.l.in)
    assert_equal('BIT4', @sensor.l.port)
  end

  def test_no_method
    assert_raise(NoMethodError) { @sensor.port }
    assert_raise(NoMethodError) { @sensor.ren }
    assert_raise(NoMethodError) { @sensor.sel }
    assert_raise(NoMethodError) { @sensor.in }
    assert_raise(NoMethodError) { @sensor.out }
    assert_raise(NoMethodError) { @sensor.dir }
  end

  def test_template
    @infrared_sensor = @sensor
    template = File.read('component_templates/infrared_sensor.erb')
    gen = ERB.new(template)
    expected = File.read('tests/C_headers_for_tests/infrared_sensor.h')

    assert_equal(expected, gen.result(binding))
  end
end