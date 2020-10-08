require "imp/league/rank"
require "imp/controls/league"

module Imp
  module Controls
    module League
      module Rank
        Team = Imp::Controls::League::Team
        Points = Imp::Controls::League::Points

        def self.tie1
          Imp::League::Rank.new(Team.team1, Points.tie)
        end

        def self.tie2
          Imp::League::Rank.new(Team.team2, Points.tie)
        end

        def self.highest
          Imp::League::Rank.new(Team.team4, Points.high)
        end

        def self.lowest
          Imp::League::Rank.new(Team.team3, Points.low)
        end
      end
    end
  end
end
