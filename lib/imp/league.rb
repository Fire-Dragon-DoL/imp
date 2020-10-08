module Imp
  class League
    Points = Struct.new(:team1, :team2)

    def team_points
      @team_points ||= {}
    end

    def points(team)
      team_points.fetch(team)
    end

    def assign_points(team, points)
      current_points = team_points.fetch(team) { 0 }
      new_points = current_points + points
      team_points[team] = new_points
    end
  end
end
