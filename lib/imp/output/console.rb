require "stringio"
require "imp/activate"

module Imp
  module Output
    class Console
      class Substitute < Console
        def self.build
          new
        end

        def text
          device.string
        end
      end

      configure :output

      def self.build
        new.tap do |instance|
          instance.device = ::STDOUT
        end
      end

      def device
        @device ||= Defaults.device
      end
      attr_writer :device

      def call(message)
        text = message.to_s
        device.puts(text)
      end

      module Defaults
        def self.device
          StringIO.new
        end
      end
    end
  end
end
