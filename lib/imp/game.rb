module Imp
  class Game
    attr_accessor :team1
    attr_accessor :score1
    attr_accessor :team2
    attr_accessor :score2

    def self.build(team1, score1, team2, score2)
      new.tap do |instance|
        instance.team1 = team1
        instance.score1 = score1
        instance.team2 = team2
        instance.score2 = score2
      end
    end
  end
end
