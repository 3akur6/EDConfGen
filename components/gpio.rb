require_relative 'constants'

class GPIO
  include Constants

  FUNCTIONS.each do |f|
    define_method(f.downcase.to_sym) { "P#{@pin}#{f}" }
  end

  attr_reader :pinout

  def initialize(pinout)
    @pinout = pinout
    @pin, @port = @pinout.scan(/P(\d+)\.(\d+)/).flatten.map(&:to_i)
  end

  def port
    "BIT#{@port}"
  end
end
