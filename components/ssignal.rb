require_relative 'gpio'
require_relative 'constants'
require_relative 'pwm'

class Ssignal < GPIO
  include Constants

  attr_reader :name, :type

  def initialize(name, pinout, type)
    @name = name
    raise 'signal type must be `PWM` or `CMN`' unless SIGNAL_TYPES.include?(type)
    @type = type
    @pinout = pinout
    @real = case @type
            when 'PWM'
              PWM.new(name, pinout)
            when 'CMN'
              GPIO.new(pinout)
            end
  end

  def unwrap
    @real
  end
end
