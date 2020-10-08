require "imp/matchday"
require "imp/controls/game"

module Imp
  module Controls
    module Matchday
      def self.example
        matchday1
      end

      def self.matchday1
        games = [Imp::Controls::Game.game1, Imp::Controls::Game.game2]
        Imp::Matchday.build(games)
      end

      def self.matchday2
        games = [Imp::Controls::Game.game3, Imp::Controls::Game.game4]
        Imp::Matchday.build(games)
      end

      def self.unplayed_matchday1
        Imp::Matchday.build([])
      end

      def self.example_two_matchdays
        [matchday1, matchday2]
      end
    end
  end
end
