require "stringio"

module Imp
  module Controls
    module Run
      SAMPLES_PATH = File.expand_path("./samples", __dir__)

      def self.input_example(file_basename)
        file_path = File.join(SAMPLES_PATH, "#{file_basename}.input")
        content = File.read(file_path)
        StringIO.new(content)
      end

      def self.output_example(file_basename)
        file_path = File.join(SAMPLES_PATH, "#{file_basename}.output")
        File.read(file_path)
      end

      def self.each_example(&block)
        samples.each do |file_basename|
          input_stream = input_example(file_basename)
          output_text = output_example(file_basename)

          block.(file_basename, input_stream, output_text)
        end
      end

      def self.samples
        filenames = Dir.glob("*.input", base: SAMPLES_PATH)

        filenames.
          map { |filename| File.basename(filename, ".input") }.
          sort
      end
    end
  end
end
