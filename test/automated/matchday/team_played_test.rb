require_relative "../../test_init"
require "imp/controls/matchday"
require "imp/controls/game/parse"

context "Imp" do
  context "Matchday" do
    context "Team Played" do
      context "Team has played" do
        matchday = Imp::Controls::Matchday.matchday1
        game = matchday.games[0]

        test "True" do
          assert(matchday.team_played?(game.team1))
        end
      end
      context "Team didn't play" do
        matchday = Imp::Controls::Matchday.matchday1
        unplaying_team1 = Imp::Controls::Game::Parse::Team.unplaying_team1

        test "False" do
          refute(matchday.team_played?(unplaying_team1))
        end
      end
    end
  end
end
