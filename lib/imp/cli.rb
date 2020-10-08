require "imp/run"

module Imp
  class CLI
    def self.call
      argf_empty = !$stdin.stat.pipe? && ARGV.empty? && $stdin.tty?

      return if argf_empty

      Run.(ARGF)
    end
  end
end
