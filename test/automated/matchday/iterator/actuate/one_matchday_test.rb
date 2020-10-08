require_relative "../../../../test_init"
require "imp/controls/matchday/iterator"
require "imp/controls/matchday"

context "Imp" do
  context "Matchday" do
    context "Iterator" do
      context "Actuate" do
        context "One Matchday" do
          matchday = Imp::Controls::Matchday.example
          iterator = Imp::Controls::Matchday::Iterator.example_games(matchday.games)
          matchdays = []

          iterator.() do |matchday|
            matchdays << matchday
          end

          test "Iterates once" do
            assert(matchdays.size == 1)
          end

          single_matchday = matchdays[0]

          test "Matchday contains all games" do
            assert(single_matchday.games == matchday.games)
          end
        end
      end
    end
  end
end
