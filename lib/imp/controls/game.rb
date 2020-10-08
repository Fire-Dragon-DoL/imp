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

      def self.game3
        Imp::Game.build(Team.team1, Score.team4, Team.team2, Score.team1)
      end

      def self.game4
        Imp::Game.build(Team.team3, Score.team3, Team.team4, Score.team2)
      end

      def self.tie
        Imp::Game.build(Team.team1, Score.team1, Team.team2, Score.team1)
      end

      def self.team1_won
        Imp::Game.build(Team.team1, Score.team3, Team.team2, Score.team1)
      end

      def self.team1_lost
        Imp::Game.build(Team.team1, Score.team1, Team.team2, Score.team3)
      end

      def self.examples
        [game1, game2]
      end

      def self.examples_four_games_four_teams
        [game1, game2, game3, game4]
      end
    end
  end
end
