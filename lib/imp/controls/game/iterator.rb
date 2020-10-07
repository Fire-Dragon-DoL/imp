require "stringio"
require "imp/controls/run"
require "imp/game/iterator"
require "imp/game/parse"

module Imp
  module Controls
    module Game
      module Iterator
        def self.example(stream)
          iterator = Imp::Game::Iterator.new
          iterator.configure(stream)
          iterator.parse = Imp::Game::Parse.build
          iterator
        end

        def self.empty_stream_example
          [StringIO.new, 0]
        end

        def self.stream_example
          stream = Run.input_example("01")
          text = stream.string.strip

          [stream, text.lines.size]
        end
      end
    end
  end
end
