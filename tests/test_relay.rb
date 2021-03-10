require 'test/unit'
require 'erb'
require_relative '../components/relay'

class TestRelay < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    @relay = Relay.new('RELAY', 'P1.3')
  end

  def test_name
    assert_equal('RELAY', @relay.name)
  end

  def test_attribute
    assert_equal('P1DIR', @relay.dir)
    assert_equal('P1OUT', @relay.out)
    assert_equal('BIT3', @relay.port)
  end

  def test_template
    @relays = [@relay]
    template = File.read('component_templates/relay.erb')
    gen = ERB.new(template, trim_mode: '-')
    expected = File.read('tests/C_headers_for_tests/relays.h')

    assert_equal(expected, gen.result(binding))
  end
end
