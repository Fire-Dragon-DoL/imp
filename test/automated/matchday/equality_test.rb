require_relative "../../test_init"
require "imp/controls/matchday"

context "Imp" do
  context "Matchday" do
    context "Equality" do
      context "Object Id differs" do
        matchday1a = Imp::Controls::Matchday.matchday1
        matchday1b = Imp::Controls::Matchday.matchday1

        assert(matchday1a.object_id != matchday1b.object_id)

        context "Games equals" do
          assert(matchday1a.games == matchday1b.games)

          test "True" do
            assert(matchday1a == matchday1b)
          end
        end
      end

      context "Games differ" do
        matchday1 = Imp::Controls::Matchday.matchday1
        matchday2 = Imp::Controls::Matchday.matchday2

        assert(matchday1.games != matchday2.games)

        test "False" do
          assert(matchday1 != matchday2)
        end
      end
    end
  end
end
