require_relative "../../test_init"
require "imp/run"
require "imp/controls/run"

context "Imp" do
  context "Actuate" do
    context "Samples" do
      Imp::Controls::Run.each_example do |name, input_stream, output_text|
        run = Imp::Run.new
        output = run.output

        # TODO: input_stream must be provided
        run.()
        result = output.text

        test "#{name}: Output Matches" do
          assert(result == output_text)
        end
      end
    end
  end
end
