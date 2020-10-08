require_relative "../../test_init"
require "imp/controls/league"
require "imp/controls/game/parse"

context "Imp" do
  context "League" do
    context "Assign Points" do
      league = Imp::Controls::League.example
      team1 = Imp::Controls::Game::Parse::Team.team1
      points1a = 12

      league.assign_points(team1, points1a)

      context "New League" do
        test "Sets Team 1 points" do
          assert(league.points(team1) == points1a)
        end
      end

      context "Ongoing League" do
        context "Existing Team" do
          points1b = 8

          league.assign_points(team1, points1b)

          test "Increases points" do
            assert(league.points(team1) == points1a + points1b)
          end
        end

        context "New Team" do
          team2 = Imp::Controls::Game::Parse::Team.team2
          points2a = 1

          league.assign_points(team2, points2a)

          test "Sets Team points" do
            assert(league.points(team2) == points2a)
          end
        end
      end
    end
  end
end
