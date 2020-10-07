require "stringio"
require "imp/activate"
require "imp/game/parse"

module Imp
  class Game
    class Iterator
      dependency :parse, Parse

      def self.configure(instance, stream: Defaults.stream)
        instance.game_iterator = build(stream: stream)
      end

      def self.build(stream: Defaults.stream)
        new.tap do |instance|
          instance.configure(stream)
        end
      end

      def stream
        @stream ||= Defaults.stream
      end

      def configure(stream)
        @stream = stream
      end

      def call(&block)
        stream.each_line do |line|
          game = parse.(line)

          if !game.nil?
            block.(game)
          end
        end
      end

      module Defaults
        def self.stream
          StringIO.new
        end
      end
    end
  end
end
