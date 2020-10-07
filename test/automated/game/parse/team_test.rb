require_relative "../../../test_init"
require "imp/controls/game/parse"

context "Imp" do
  context "Game" do
    context "Parse" do
      context "Team" do
        controls = Imp::Controls::Game::Parse
        parse = controls.example

        context "Team1" do
          result = parse.team(controls::Team.team1.to_s)

          test "Parsed" do
            assert(result == controls::Team.team1)
          end
        end

        context "Team2" do
          result = parse.team(controls::Team.team2.to_s)

          test "Parsed" do
            assert(result == controls::Team.team2)
          end
        end

        context "Team3" do
          result = parse.team(controls::Team.team3.to_s)

          test "Parsed" do
            assert(result == controls::Team.team3)
          end
        end

        context "Empty team" do
          result = parse.team(controls::Team.empty.to_s)

          test "Nil" do
            assert(result.nil?)
          end
        end
      end
    end
  end
end
