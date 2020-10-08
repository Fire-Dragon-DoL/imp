module Imp
  class Game
    class Iterator
      class Fixed
        def self.configure(instance)
          instance.game_iterator = build
        end

        def self.build
          new
        end

        def games
          @games ||= []
        end
        attr_writer :games

        def call(&block)
          games.each do |game|
            block.(game)
          end
        end
      end
    end
  end
end
