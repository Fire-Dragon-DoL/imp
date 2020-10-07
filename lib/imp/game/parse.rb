require "imp/activate"
require "imp/game"
require "imp/log"

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

      include Log::Dependency

      REGEX = /^([^,]+)\s+(\d+),\s*([^,]+)\s+(\d+)$/.freeze

      configure :parse

      def self.build
        new
      end

      def self.call(text)
        instance = build
        instance.(text)
      end

      def call(text)
        logger.trace(tags: [:parse]) do
          "Parsing game (Text: `#{text}`)"
        end

        clear_text = text.to_s.strip
        match = REGEX.match(clear_text)

        if match.nil?
          logger.debug(tag: :parse) { "Game parsing failed (Text: `#{text}`)" }
          return nil
        end

        team1 = team(match[1])
        score1 = score(match[2])
        team2 = team(match[3])
        score2 = score(match[4])

        if team1.nil? || team2.nil? || score1.nil? || score2.nil?
          logger.debug(tag: :parse) { "Game parsing failed (Text: `#{text}`)" }
          return nil
        end

        Game.build(team1, score1, team2, score2)
      end

      def team(text)
        clear_text = text.to_s.strip

        return nil if clear_text.empty?

        clear_text
      end

      def score(text)
        Integer(text)
      rescue
        nil
      end
    end
  end
end
