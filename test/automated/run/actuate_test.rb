require_relative "../../test_init"
require "imp/run"
require "imp/controls/run"

context "Imp" do
  context "Run" do
    context "Actuate" do
      context "Samples" do
        Imp::Controls::Run.each_example do |name, stream, output_text|
          run = Imp::Controls::Run.example(stream: stream)
          output = run.output

          run.()
          result = output.text

          test "#{name}: Output Matches" do
            assert(result.strip == output_text.strip)
          end
        end
      end
    end
  end
end
