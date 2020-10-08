require_relative "../../../test_init"
require "imp/controls/league"
require "imp/controls/league/ranking"

context "Imp" do
  context "League" do
    context "Ranking" do
      context "Top" do
        teams = Imp::Controls::League::Team
        points = Imp::Controls::League::Points
        ranking = Imp::Controls::League::Ranking.example
        league = Imp::Controls::League.team_2_and_3_tie_team1_low

        total_ranks = ranking.(league)
        ranks = ranking.top(league, 1)

        assert(total_ranks.size > 1)

        test "Ranks amount limited" do
          assert(ranks.size == 1)
        end
      end
    end
  end
end
