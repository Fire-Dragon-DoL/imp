require_relative "../../test_init"
require "imp/controls/game"

context "Imp" do
  context "Game" do
    context "Equality" do
      context "Object Id differs" do
        game1a = Imp::Controls::Game.game1
        game1b = Imp::Controls::Game.game1

        assert(game1a.object_id != game1b.object_id)

        context "Teams and scores equals" do
          assert(game1a.team1 == game1b.team1)
          assert(game1a.team2 == game1b.team2)
          assert(game1a.score1 == game1b.score1)
          assert(game1a.score2 == game1b.score2)

          test "True" do
            assert(game1a == game1b)
          end
        end
      end

      context "Teams differ" do
        game1 = Imp::Controls::Game.game1
        game2 = Imp::Controls::Game.game2

        assert(game1.team1 != game2.team1)
        assert(game1.team2 != game2.team2)

        test "False" do
          assert(game1 != game2)
        end
      end
    end
  end
end
