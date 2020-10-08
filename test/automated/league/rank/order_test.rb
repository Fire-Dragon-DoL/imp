require_relative "../../../test_init"
require "imp/controls/league/rank"

context "Imp" do
  context "League" do
    context "Rank" do
      context "Order" do
        rank1 = Imp::Controls::League::Rank.tie1
        rank2 = Imp::Controls::League::Rank.tie2
        rank3 = Imp::Controls::League::Rank.highest
        rank4 = Imp::Controls::League::Rank.lowest

        ranks = [rank1, rank2, rank3, rank4].sort

        context "Highest amount of points" do
          test "First" do
            assert(ranks[0] == rank3)
          end
        end

        context "Tie" do
          test "Same amount of points" do
            assert(ranks[1].points == ranks[2].points)
          end

          test "Alphabetical" do
            assert(ranks[1].team < ranks[2].team)
          end
        end

        context "Lowest amount of points" do
          test "Last" do
            assert(ranks[3].team == rank4.team)
          end
        end
      end
    end
  end
end
