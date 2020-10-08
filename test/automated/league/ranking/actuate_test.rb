require_relative "../../../test_init"
require "imp/controls/league"
require "imp/controls/league/ranking"

context "Imp" do
  context "League" do
    context "Ranking" do
      teams = Imp::Controls::League::Team
      points = Imp::Controls::League::Points
      ranking = Imp::Controls::League::Ranking.example

      context "Empty League" do
        league = Imp::Controls::League.example

        ranks = ranking.(league)

        test "Empty Ranks" do
          assert(ranks.empty?)
        end
      end

      context "Ongoing League with ties" do
        league = Imp::Controls::League.team_2_and_3_tie_team1_low

        ranks = ranking.(league)

        context "Rank 1" do
          test "Team 2" do
            assert(ranks[0].team == teams.team2)
          end

          test "Team 2 points high" do
            assert(ranks[0].points == points.high)
          end
        end

        context "Rank 2" do
          test "Team 3" do
            assert(ranks[1].team == teams.team3)
          end

          test "Team 3 points high" do
            assert(ranks[1].points == points.high)
          end
        end

        context "Rank 3" do
          test "Team 1" do
            assert(ranks[2].team == teams.team1)
          end

          test "Team 1 points low" do
            assert(ranks[2].points == points.low)
          end
        end
      end
    end
  end
end
