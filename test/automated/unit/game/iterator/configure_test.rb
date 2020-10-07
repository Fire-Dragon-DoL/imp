require_relative "../../../../test_init"
require "imp/game/iterator"
require "imp/controls/game/iterator"

context "Imp" do
  context "Game Iterator" do
    context "Configure" do
      stream, _lines = Imp::Controls::Game::Iterator.empty_stream_example
      iterator = Imp::Game::Iterator.new

      iterator.configure(stream)

      test "Stream is set" do
        assert(iterator.stream == stream)
      end
    end
  end
end
