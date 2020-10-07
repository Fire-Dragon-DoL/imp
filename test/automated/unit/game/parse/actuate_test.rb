require_relative "../../../../test_init"
require "imp/controls/game/parse"

context "Imp" do
  context "Game Parse" do
    context "Actuate" do
      controls = Imp::Controls::Game::Parse
      parse = controls.example

      context "Empty Line" do
        result = parse.(controls.empty_line)

        test "Nil" do
          assert(result.nil?)
        end
      end

      context "Single Team" do
        result = parse.(controls.single_team)

        test "Nil" do
          assert(result.nil?)
        end
      end

      context "One team empty" do
        result = parse.(controls.second_empty_team)

        test "Nil" do
          assert(result.nil?)
        end
      end

      context "One team without score" do
        result = parse.(controls.team_without_score)

        test "Nil" do
          assert(result.nil?)
        end
      end

      context "More than two teams" do
        result = parse.(controls.more_than_two_teams)

        test "Nil" do
          assert(result.nil?)
        end
      end

      context "Empty 3rd team" do
        result = parse.(controls.empty_third_team)

        test "Nil" do
          assert(result.nil?)
        end
      end

      context "Two teams with score" do
        result = parse.(controls.two_teams_with_score)

        test "Team 1 present" do
          assert(result.team1 == controls::Team.team1)
        end

        test "Team 2 present" do
          assert(result.team2 == controls::Team.team2)
        end

        test "Team 1 score present" do
          assert(result.team1_score == controls::Score.team1)
        end

        test "Team 2 score present" do
          assert(result.team2_score == controls::Score.team2)
        end
      end
    end
  end
end
