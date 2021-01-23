require 'test/unit'
require 'erb'
require_relative '../components/button'

class TestButton < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    @button1 = Button.new('BUTTON_A', 'P2.1')
    @button2 = Button.new('BUTTON_B', 'P1.1')
  end

  def test_name
    assert_equal('BUTTON_A', @button1.name)
    assert_equal('BUTTON_B', @button2.name)
  end

  def test_attribute
    assert_equal('P2DIR', @button1.dir)
    assert_equal('P2IN', @button1.in)
    assert_equal('BIT1', @button1.port)

    assert_equal('P1DIR', @button2.dir)
    assert_equal('P1IN', @button2.in)
    assert_equal('BIT1', @button2.port)
  end

  def test_no_method
    assert_raise(NoMethodError) { @button1.sel }
  end

  def test_template
    @buttons = [@button1, @button2]
    template = File.read('component_templates/button.erb')
    gen = ERB.new(template, trim_mode: '-')
    expected = File.read('tests/C_headers_for_tests/buttons.h')

    assert_equal(expected, gen.result(binding))
  end
end