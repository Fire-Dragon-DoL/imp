require "stringio"
require "imp/activate"
require "imp/game/parse"
require "imp/game/iterator/fixed"

module Imp
  class Game
    class Iterator
      module Substitute
        def self.build
          Fixed.build
        end
      end

      dependency :parse, Parse

      def self.configure(instance, stream: nil, game_iterator: nil)
        if !stream.nil? && game_iterator.nil?
          raise ArgumentError, "Can be configured with stream or game iterator"
        end

        configured_game_iterator = game_iterator || build(stream: stream)
        instance.game_iterator = configured_game_iterator
      end

      def self.build(stream: nil)
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
