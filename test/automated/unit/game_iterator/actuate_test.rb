require_relative "../../../test_init"
require "imp/game/iterator"
require "imp/controls/game/iterator"

context "Imp" do
  context "Game Iterator" do
    context "Actuate" do
      games = []
      stream, lines = Imp::Controls::Game::Iterator.stream_example
      iterator = Imp::Controls::Game::Iterator.example(stream)

      iterator.() do |game|
        games << game
      end

      test "Iterates for each game in stream" do
        assert(games.size == lines)
      end
    end
  end
end
