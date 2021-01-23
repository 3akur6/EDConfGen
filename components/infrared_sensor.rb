require_relative 'plugin'

class InfraredSensor < Plugin
  undef_method :sel, :dir, :ren, :out, :in, :port, :name
  attr_reader :l, :c, :r

  def initialize(name, pinouts)
    @name = name
    check = (pinouts.key?('L') && pinouts.key?('C') && pinouts.key?('R'))
    raise 'pinouts hash for `InfraredSensor` must have `L, C, R` keys' unless check

    @pinouts = pinouts

    transform_pinouts
  end

  private

  def transform_pinouts
    @pinouts.each do |k, v|
      instance_variable_set("@#{k.downcase}".to_sym, GPIO.new(v))
    end
  end
end
