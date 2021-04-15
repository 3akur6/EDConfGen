require 'json'
require 'erb'

class Generator
  def initialize(config)
    @raw = File.read(config)
    @json = JSON.parse(@raw)
    @parsed = false
  end

  def parse
    @parsed = (parse_buttons if @json.dig('buttons')) &&
              (parse_leds if @json.dig('leds')) &&
              (parse_infrared_sensor if @json.dig('infrared_sensor')) &&
              (parse_signals if @json.dig('pwms') || @json.dig('cmns')) &&
              (parse_motor_driver if @json.dig('motor_driver')) &&
              (parse_relays if @json.dig('relays')) && (parse_uarts if @json.dig('uarts')) &&
              (parse_mos if @json.dig('mos'))
    self
  end

  def result
    parse unless @parsed
    template = ERB.new(File.read('gpio_config_template.erb'), trim_mode: '-')
    template.result(binding)
  end

  private

  def parse_buttons
    @buttons = []
    @json['buttons'].each { |k, v| @buttons << Button.new(k, v) }
    self
  end

  def parse_leds
    @leds = []
    @json['leds'].each { |k, v| @leds << LED.new(k, v) }
    self
  end

  def parse_signals
    @ssignals = []
    begin
      @json.dig('pwms').each { |k, v| @ssignals << Ssignal.new(k, v, 'PWM') }
      @json.dig('cmns').each { |k, v| @ssignals << Ssignal.new(k, v, 'CMN') }
    rescue NoMethodError
      nil
    end
    self
  end

  def parse_motor_driver
    enable_signals = {}
    control_pinouts = {}
    @json.dig('motor_driver').each do |k, v|
      key = case k
            when 'left'
              'SIGNAL_A'
            when 'right'
              'SIGNAL_B'
            end
      control_pinouts[key] = v['control_pinouts']
      enable_signals[key] = @ssignals.find { |s| s.name == v['enable_signal'].values[0] }.unwrap
    end
    @motor_driver = MotorDriver.new('MOTOR_DRIVER_A', control_pinouts, enable_signals)
    self
  end

  def parse_infrared_sensor
    @infrared_sensor = InfraredSensor.new('INFRARED_SENSOR_A', @json['infrared_sensor'])
    self
  end

  def parse_relays
    @relays = []
    @json.dig('relays').each { |k, v| @relays << Relay.new(k, v) }
    self
  end

  def parse_mos
    @mos = []
    @json.dig('mos').each { |k, v| @mos << MOS.new(k, v) }
    self
  end

  def parse_uarts
    @uarts = []
    @json.dig('uarts').each { |k, v| @uarts << UART.new(k, v) }
    self
  end
end
