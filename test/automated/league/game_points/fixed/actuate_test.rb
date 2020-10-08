require_relative "../../../../test_init"
require "imp/controls/league/game_points"
require "imp/controls/game"

context "Imp" do
  context "League" do
    context "Game Points" do
      context "Fixed" do
        game = Imp::Controls::Game.game1
        game_points = Imp::Controls::League::GamePoints.points_12_vs_7_example

        points = game_points.(game)

        context "Team 1 points" do
          test "Equal to fixed team 1 points" do
            assert(points.team1 == game_points.team1)
          end
        end

        context "Team 2 points" do
          test "Equal to fixed team 2 points" do
            assert(points.team2 == game_points.team2)
          end
        end
      end
    end
  end
end
