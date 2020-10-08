module Imp
  class League
    class Rank
      include Comparable

      attr_accessor :team
      attr_accessor :points

      def initialize(team, points)
        @team = team
        @points = points
      end

      def <=>(other)
        return nil if !other.is_a?(self.class)
        return team <=> other.team if points == other.points
        return -1 if points > other.points
        return 1
      end

      def to_s
        return "#{team}, #{points} pt" if points == 1
        "#{team}, #{points} pts"
      end
    end
  end
end
