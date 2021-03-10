require 'test/unit'
require 'erb'
require_relative '../components/uart'

class TestUART < Test::Unit::TestCase
  def initialize(test_method_name)
    super
    @uart1 = UART.new('UART_A', { 'TXD' => 'P3.3', 'RXD' => 'P3.4' })
    @uart2 = UART.new('UART_B', { 'TXD' => 'P4.4', 'RXD' => 'P4.5' })
  end

  def test_name
    assert_equal('UART_A', @uart1.name)
    assert_equal('UART_B', @uart2.name)
  end

  def test_attribute
    assert_equal('UCA0CTL1', @uart1.ctl)
    assert_equal('UCA1CTL1', @uart2.ctl)
    assert_equal('P3SEL', @uart1.sel)
    assert_equal('P4SEL', @uart2.sel)
    assert_equal('BIT3', @uart1.txd)
    assert_equal('BIT4', @uart1.rxd)
    assert_equal('BIT4', @uart2.txd)
    assert_equal('BIT5', @uart2.rxd)
    assert_equal('UCA0BR0', @uart1.br0)
    assert_equal('UCA0BR1', @uart1.br1)
    assert_equal('UCA1BR0', @uart2.br0)
    assert_equal('UCA1BR1', @uart2.br1)
    assert_equal('UCA0MCTL', @uart1.mctl)
  end

  def test_template
    @uarts = [@uart1, @uart2]
    template = File.read('component_templates/uart.erb')
    gen = ERB.new(template, trim_mode: '-')
    expected = File.read('tests/C_headers_for_tests/uarts.h')

    assert_equal(expected, gen.result(binding))
  end
end
