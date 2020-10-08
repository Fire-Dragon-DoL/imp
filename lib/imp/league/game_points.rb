require "imp/activate"

module Imp
  class League
    class GamePoints
      Points = Struct.new(:team1, :team2)

      module Substitute
        class Fixed < GamePoints
          def team1
            @team1 ||= 0
          end
          attr_writer :team1

          def team2
            @team2 ||= 0
          end
          attr_writer :team2

          def call(_game)
            Points.new(team1, team2)
          end
        end

        def self.build
          Fixed.build
        end
      end

      configure :game_points

      def self.build
        new
      end

      def self.call(game)
        instance = build
        instance.(game)
      end

      def call(game)
        return Points.new(1, 1) if game.tie?
        return Points.new(3, 0) if game.team1_won?
        Points.new(0, 3)
      end
    end
  end
end
