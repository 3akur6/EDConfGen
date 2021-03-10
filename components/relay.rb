require_relative 'plugin'

class Relay < Plugin
  undef_method :in, :sel, :ren
end
