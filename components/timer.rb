require_relative 'constants'

class Timer
  include Constants

  attr_reader :name
  attr_accessor :mc, :ssel

  def initialize(name, pinout)
    @name = name

    x = TIMER_TABLE.dig(pinout).scan(/T.(\d)\.\d/).flatten[0].to_i

    @taxctl = "TA#{x}CTL"
    @taxccr0 = "TA#{x}CCR0"
  end

  def ctl
    @taxctl
  end

  def ceiling
    @taxccr0
  end
end
