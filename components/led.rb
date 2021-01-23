require_relative 'plugin'

class LED < Plugin
  undef_method :in, :sel, :ren
end
