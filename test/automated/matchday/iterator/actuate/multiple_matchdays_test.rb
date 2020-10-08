require_relative "../../../../test_init"
require "imp/controls/matchday/iterator"
require "imp/controls/matchday"
require "imp/controls/game/parse"

context "Imp" do
  context "Matchday" do
    context "Iterator" do
      context "Actuate" do
        context "Multiple Matchdays" do
          matchdays = Imp::Controls::Matchday.example_two_matchdays
          iterator = Imp::Controls::Matchday::Iterator.example(matchdays)
          iterated_matchdays = []

          iterator.() do |matchday|
            iterated_matchdays << matchday
          end

          test "Iterates for all matchdays" do
            assert(matchdays == iterated_matchdays)
          end
        end
      end
    end
  end
end
