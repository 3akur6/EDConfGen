require_relative 'plugin'

class MOS < Plugin
  undef_method :in, :sel, :ren
end
