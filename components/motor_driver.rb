require_relative 'plugin'

class MotorDriver < Plugin
  undef_method :dir, :in, :out, :ren, :sel, :port
  attr_reader :en_x, :en_y, :in_a, :in_b, :in_c, :in_d

  def initialize(name, control_pinouts, enable_signals)
    @name = name
    check_control_pinouts(control_pinouts)
    check_enable_signals(enable_signals)
    @control_pinouts = control_pinouts
    @signals = enable_signals
    transform_control_pinouts
    transform_enable_signals
    @en_x = @signal_a
    @en_y = @signal_b
  end

  private

  def check_control_pinouts(pinouts)
    check = (pinouts['SIGNAL_A'].key?('IN_A') && pinouts['SIGNAL_A'].key?('IN_B') &&
      pinouts['SIGNAL_B'].key?('IN_C') && pinouts['SIGNAL_B'].key?('IN_D'))

    raise 'pinouts hash for `MotorDriver` must have `IN_A, IN_B, IN_C, IN_D` keys' unless check
  end

  def check_enable_signals(signals)
    check = (signals.key?('SIGNAL_A') && signals.key?('SIGNAL_B'))

    raise 'signals hash for `MotorDriver` must have `SIGNAL_A, SIGNAL_B` keys' unless check
  end

  def transform_control_pinouts
    @control_pinouts.each do |_, hash|
      hash.each do |k, v|
        instance_variable_set("@#{k.downcase}".to_sym, GPIO.new(v))
      end
    end
  end

  def transform_enable_signals
    @signals.each do |k, v|
      instance_variable_set("@#{k.downcase}".to_sym, v)
    end
  end
end
