require_relative "../../../test_init"
require "imp/controls/game/parse"

context "Imp" do
  context "Game" do
    context "Parse" do
      context "Score" do
        controls = Imp::Controls::Game::Parse
        parse = controls.example

        context "Team1" do
          result = parse.score(controls::Score.team1.to_s)

          test "Parsed" do
            assert(result == controls::Score.team1)
          end
        end

        context "Team2" do
          result = parse.score(controls::Score.team2.to_s)

          test "Parsed" do
            assert(result == controls::Score.team2)
          end
        end

        context "Team3" do
          result = parse.score(controls::Score.team3.to_s)

          test "Parsed" do
            assert(result == controls::Score.team3)
          end
        end

        context "Empty score" do
          result = parse.score(controls::Score.empty.to_s)

          test "Nil" do
            assert(result.nil?)
          end
        end
      end
    end
  end
end
