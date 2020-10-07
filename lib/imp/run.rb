require "imp/activate"
require "imp/output/console"

module Imp
  class Run
    dependency :output, Output::Console

    configure :run

    def self.build
      new.tap do |instance|
        Output::Console.configure(instance)
      end
    end

    def self.call(io_stream)
      instance = build
      instance.(io_stream)
    end

    def call(io_stream)
      output_path = File.expand_path("controls/run/samples/01.output", __dir__)
      text = File.read(output_path)

      output.(text)
    end
  end
end
