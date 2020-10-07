module Imp
  class Game
    attr_accessor :team1
    attr_accessor :team1_score
    attr_accessor :team2
    attr_accessor :team2_score

    def self.build(team1, team1_score, team2, team2_score)
      new.tap do |instance|
        instance.team1 = team1
        instance.team1_score = team1_score
        instance.team2 = team2
        instance.team2_score = team2_score
      end
    end
  end
end
