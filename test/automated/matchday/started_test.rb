require_relative "../../test_init"
require "imp/controls/matchday"

context "Imp" do
  context "Matchday" do
    context "Started" do
      context "Multiple games played" do
        matchday = Imp::Controls::Matchday.matchday1

        assert(matchday.games.size > 0)

        test "True" do
          assert(matchday.started?)
        end
      end

      context "No games played" do
        matchday = Imp::Controls::Matchday.unplayed_matchday1

        assert(matchday.games.size == 0)

        test "False" do
          refute(matchday.started?)
        end
      end
    end
  end
end
