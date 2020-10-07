require "log"

module Imp
  class Log < ::Log
    def tag!(tags)
      tags << :imp
    end
  end
end
