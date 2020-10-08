require "imp/league/game_points"

module Imp
  module Controls
    module League
      module GamePoints
        def self.example
          Imp::League::GamePoints.build
        end

        def self.fixed_example(team1, team2)
          Imp::League::GamePoints::Substitute::Fixed.build.tap do |instance|
            instance.team1 = team1
            instance.team2 = team2
          end
        end

        def self.points_12_vs_7_example
          fixed_example(12, 7)
        end
      end
    end
  end
end
