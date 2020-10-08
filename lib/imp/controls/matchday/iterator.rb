require "imp/matchday/iterator"

module Imp
  module Controls
    module Matchday
      module Iterator
        def self.example_games(games = [])
          Imp::Matchday::Iterator.new.tap do |instance|
            game_iterator = instance.game_iterator
            game_iterator.games = games
          end
        end

        def self.example(matchdays = [])
          games = matchdays.map(&:games).flatten
          example_games(games)
        end
      end
    end
  end
end
