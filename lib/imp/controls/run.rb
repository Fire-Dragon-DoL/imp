require "stringio"

module Imp
  module Controls
    module Run
      SAMPLES_PATH = File.expand_path("./run/samples", __dir__)

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
        Dir.foreach(SAMPLES_PATH) do |filename|
          next if !filename.end_with?(".input")

          file_basename = File.basename(filename, ".input")

          input_stream = input_example(file_basename)
          output_text = output_example(file_basename)

          block.(file_basename, input_stream, output_text)
        end
      end
    end
  end
end
