require "imp/controls/game/parse"
require "imp/game"

module Imp
  module Controls
    module Game
      Team = Imp::Controls::Game::Parse::Team
      Score = Imp::Controls::Game::Parse::Score

      def self.game1
        Imp::Game.build(Team.team1, Score.team1, Team.team2, Score.team2)
      end

      def self.game2
        Imp::Game.build(Team.team3, Score.team3, Team.team4, Score.team4)
      end

      def self.examples
        [game1, game2]
      end
    end
  end
end
