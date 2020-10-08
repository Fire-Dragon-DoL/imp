require "imp/activate"
require "imp/league/rank"

module Imp
  class League
    class Ranking
      module Substitute
        class Empty < Ranking
          def call
            []
          end
        end

        def self.build
          Empty.new
        end
      end

      configure :ranking

      def self.build
        new
      end

      def call(league)
        league.
          team_points.
          map { |team, points| Rank.new(team, points) }.
          sort
      end

      def top(league, teams_count)
        ranks = call(league)
        ranks.take(teams_count)
      end
    end
  end
end
