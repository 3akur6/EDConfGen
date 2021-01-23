require_relative 'gpio'
require_relative 'timer'
require_relative 'constants'

class PWM < GPIO
  include Constants

  attr_reader :name, :outmod, :timer
  undef_method :in, :ren

  def initialize(name, pinout)
    super(pinout)

    @name = name
    timer_name = "TIMER_#{@name.scan(/\w+_(\w+)$/).flatten[0]}"
    @timer = Timer.new(timer_name, pinout)
    @timer.mc = 'MC_1'
    @timer.ssel = 'TASSEL_2'

    @outmod = 'OUTMOD_7'
    @tax_n = TIMER_TABLE.dig(pinout)
    @x, @n = @tax_n.scan(/T.(\d)\.(\d)/).flatten.map(&:to_i)
  end

  def ctl
    "TA#{@x}CCTL#{@n}"
  end

  def ceiling
    "TA#{@x}CCR#{@n}"
  end
end
