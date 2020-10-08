module Imp
  class Matchday
    def games
      @games ||= []
    end
    attr_writer :games

    def self.build(games)
      new.tap do |instance|
        instance.games = games
      end
    end

    def ==(other)
      other.is_a?(self.class) && games == other.games
    end

    def team_played?(team)
      games.any? do |game|
        game.team1 == team || game.team2 == team
      end
    end

    def started?
      games.size > 0
    end

    def each_game(&block)
      games.each(&block)
    end
  end
end
