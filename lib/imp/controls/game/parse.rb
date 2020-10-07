require "imp/game/parse"

module Imp
  module Controls
    module Game
      module Parse
        def self.example
          Imp::Game::Parse.build
        end

        def self.empty_line
          ""
        end

        def self.single_team
          "#{Team.team1} #{Score.team1}"
        end

        def self.second_empty_team
          "#{Team.team1} #{Score.team1}, "
        end

        def self.team_without_score
          "#{Team.team1}, #{Team.team2} #{Score.team2}"
        end

        def self.more_than_two_teams
          "#{Team.team1} #{Score.team1}, " \
          "#{Team.team2} #{Score.team2}, " \
          "#{Team.team3} #{Score.team3}"
        end

        def self.empty_third_team
          "#{Team.team1} #{Score.team1}, #{Team.team2} #{Score.team2},"
        end

        def self.two_teams_with_score
          "#{Team.team1} #{Score.team1}, #{Team.team2} #{Score.team2}"
        end

        module Team
          def self.team1
            "A Team"
          end

          def self.team2
            "B Team"
          end

          def self.team3
            "C Team"
          end

          def self.empty
            ""
          end
        end

        module Score
          def self.team1
            3
          end

          def self.team2
            3
          end

          def self.team3
            12
          end

          def self.empty
            nil
          end
        end
      end
    end
  end
end
