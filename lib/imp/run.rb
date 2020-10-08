require "imp/activate"
require "imp/game/iterator"
require "imp/output/console"
require "imp/log"

module Imp
  class Run
    include Log::Dependency

    dependency :output, Output::Console

    configure :run

    def self.build(stream: nil, game_iterator: nil)
      new.tap do |instance|
        Output::Console.configure(instance)
        # Matchday::Iterator.configure(instance, stream: stream, game_iterator: game_iterator)
      end
    end

    def self.call(stream)
      instance = build(stream: stream)
      instance.()
    end

    def call
      logger.trace(tag: :run) { "Starting Imp" }

      output_path = File.expand_path("controls/samples/01.output", __dir__)
      text = File.read(output_path)

      output.(text)
    end
  end
end
