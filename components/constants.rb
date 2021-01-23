module Constants
  FUNCTIONS = %w[IN OUT DIR REN SEL].freeze

  TIMER_TABLE = {
    'P1.1' => 'TA0.0', 'P1.2' => 'TA0.1', 'P1.3' => 'TA0.2', 'P1.4' => 'TA0.3', 'P1.5' => 'TA0.4',
    'P1.7' => 'TA1.0', 'P2.0' => 'TA1.1', 'P2.1' => 'TA1.2',
    'P2.3' => 'TA2.0', 'P2.4' => 'TA2.1', 'P2.5' => 'TA2.2'
  }.freeze

  SIGNAL_TYPES = %w[CMN PWM].freeze
end
