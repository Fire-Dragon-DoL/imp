require_relative "../../../test_init"
require "imp/controls/league/game_points"
require "imp/controls/game"

context "Imp" do
  context "League" do
    context "Game Points" do
      context "Tie" do
        game = Imp::Controls::Game.tie
        game_points = Imp::Controls::League::GamePoints.example

        assert(game.tie?)
        points = game_points.(game)

        test "Team 1 points: 1" do
          assert(points.team1 == 1)
        end

        test "Team 2 points: 1" do
          assert(points.team2 == 1)
        end
      end

      context "Team 1 won" do
        game = Imp::Controls::Game.team1_won
        game_points = Imp::Controls::League::GamePoints.example

        assert(game.team1_won?)
        points = game_points.(game)

        test "Team 1 points: 3" do
          assert(points.team1 == 3)
        end

        test "Team 2 points: 0" do
          assert(points.team2 == 0)
        end
      end

      context "Team 1 lost" do
        game = Imp::Controls::Game.team1_lost
        game_points = Imp::Controls::League::GamePoints.example

        assert(game.team1_lost?)
        points = game_points.(game)

        test "Team 1 points: 0" do
          assert(points.team1 == 0)
        end

        test "Team 2 points: 3" do
          assert(points.team2 == 3)
        end
      end
    end
  end
end
