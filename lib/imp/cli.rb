require "imp/run"

module Imp
  class CLI
    def self.call
      Run.(ARGF)
    end
  end
end
