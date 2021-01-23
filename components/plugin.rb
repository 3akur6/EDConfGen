require_relative 'gpio'

class Plugin < GPIO
  attr_reader :name

  def initialize(name, pinout)
    super(pinout)
    @name = name
  end
end
