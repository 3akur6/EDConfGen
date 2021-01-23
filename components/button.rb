require_relative 'plugin'

class Button < Plugin
  undef_method :sel
end
