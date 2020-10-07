require "imp/activate"
require "imp/game"

module Imp
  class Game
    class Parse
      module Substitute
        class Fixed
          def call(_text)
            nil
          end
        end

        def self.build
          Fixed.new
        end
      end

      configure :parse

      def self.build
        new
      end

      def self.call(text)
        instance = build
        instance.(text)
      end

      def call(text)
        clear_text = text.to_s.strip

        return nil if clear_text == ""

        Game.new
      end
    end
  end
end
