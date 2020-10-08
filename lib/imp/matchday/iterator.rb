require "imp/activate"
require "imp/game/iterator"
require "imp/matchday"

module Imp
  class Matchday
    class Iterator
      module Substitute
        def self.build
          Iterator.build
        end
      end

      dependency :game_iterator, Imp::Game::Iterator

      def self.configure(instance, stream: nil, game_iterator: nil)
        iterator = build(stream: stream, game_iterator: game_iterator)
        instance.matchday_iterator = iterator
      end

      def self.build(stream: nil, game_iterator: nil)
        new.tap do |instance|
          Imp::Game::Iterator.configure(instance, stream: stream, game_iterator: game_iterator)
        end
      end

      def self.call(stream: nil, game_iterator: nil, &block)
        instance = build(stream: stream, game_iterator: game_iterator)
        instance.(&block)
      end

      def call(&block)
        matchday = Matchday.new

        game_iterator.() do |game|
          if matchday.team_played?(game.team1) || matchday.team_played?(game.team2)
            block.(matchday)
            matchday = Matchday.new
          end

          matchday.games << game
        end

        if matchday.started?
          block.(matchday)
        end
      end
    end
  end
end
