require "imp/league"
require "imp/controls/game/parse"

module Imp
  module Controls
    module League
      module Points
        def self.high
          22
        end

        def self.tie
          7
        end

        def self.low
          2
        end
      end

      Team = Imp::Controls::Game::Parse::Team

      def self.example
        Imp::League.new
      end

      def self.team_2_and_3_tie_team1_low
        example.tap do |league|
          league.assign_points(Team.team1, Points.low)
          league.assign_points(Team.team3, Points.high)
          league.assign_points(Team.team2, Points.high)
        end
      end
    end
  end
end
