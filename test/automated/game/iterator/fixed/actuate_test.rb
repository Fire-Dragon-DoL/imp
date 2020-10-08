require_relative "../../../../test_init"
require "imp/controls/game"
require "imp/game/iterator/fixed"

context "Imp" do
  context "Game" do
    context "Iterator" do
      context "Fixed" do
        context "Actuate" do
          games = []
          iterator = Imp::Game::Iterator::Fixed.build
          iterator.games = Imp::Controls::Game.examples

          iterator.() do |game|
            games << game
          end

          test "Iterates each game in games list" do
            assert(games == iterator.games)
          end
        end
      end
    end
  end
end
