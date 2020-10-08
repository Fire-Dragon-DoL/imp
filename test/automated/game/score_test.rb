require_relative "../../test_init"
require "imp/controls/game"

context "Imp" do
  context "Game" do
    context "Score" do
      context "Equivalent" do
        game = Imp::Controls::Game.tie

        assert(game.score1 == game.score2)

        test "Tie" do
          assert(game.score1 == game.score2)
        end
      end

      context "Team 1 higher" do
        game = Imp::Controls::Game.team1_won

        assert(game.score1 > game.score2)

        test "Team 1 won" do
          assert(game.team1_won?)
        end

        test "Team 2 lost" do
          assert(game.team2_lost?)
        end
      end

      context "Team 1 lower" do
        game = Imp::Controls::Game.team1_lost

        assert(game.score2 > game.score1)

        test "Team 1 lost" do
          assert(game.team1_lost?)
        end

        test "Team 2 won" do
          assert(game.team2_won?)
        end
      end
    end
  end
end
