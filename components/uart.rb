require_relative 'gpio'
require_relative 'constants'

class UART < GPIO
  attr_reader :pinouts, :name, :ctl, :sel, :br0, :br1, :mctl
  def initialize(name, pinouts)
    @name = name
    @pinouts = pinouts.values
    @txd, @rxd = @pinouts
    @ctl = _ctl
    @pin = pin
    @ucxn = @ctl.scan(/(UC.\d)CTL./)[0][0]
    @br0 = "#{@ucxn}BR0"
    @br1 = "#{@ucxn}BR1"
    @mctl = "#{@ucxn}MCTL"
  end

  def sel
    "#{@pin}SEL"
  end

  def txd
    "BIT#{@txd.scan(/P\d\.(\d)/)[0][0]}"
  end

  def rxd
    "BIT#{@rxd.scan(/P\d\.(\d)/)[0][0]}"
  end

  private

  def _ctl
    ctl = UART_TABLE.dig(@txd)
    ctl if ctl == UART_TABLE.dig(@rxd)
  end

  def pin
    txd_pre = @txd.scan(/(P\d)\.\d/)[0][0]
    rxd_pre = @rxd.scan(/(P\d)\.\d/)[0][0]
    txd_pre if txd_pre == rxd_pre
  end
end
