require 'test/unit'
require 'erb'
require_relative '../components/mos'

class TestMOS < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    @mos = MOS.new('MOS', 'P2.7')
  end

  def test_name
    assert_equal('MOS', @mos.name)
  end

  def test_attribute
    assert_equal('P2DIR', @mos.dir)
    assert_equal('P2OUT', @mos.out)
    assert_equal('BIT7', @mos.port)
  end

  def test_template
    @mos = [@mos]
    template = File.read('component_templates/mos.erb')
    gen = ERB.new(template, trim_mode: '-')
    expected = File.read('tests/C_headers_for_tests/mos.h')

    assert_equal(expected, gen.result(binding))
  end
end
