require "imp/activate"
require "imp/league"
require "imp/league/game_points"
require "imp/league/ranking"
require "imp/matchday/iterator"
require "imp/output/console"
require "imp/log"

module Imp
  class Run
    include Log::Dependency

    dependency :game_points, League::GamePoints
    dependency :matchday_iterator, Matchday::Iterator
    dependency :output, Output::Console
    dependency :ranking, League::Ranking

    configure :run

    def self.build(stream: nil, game_iterator: nil)
      new.tap do |instance|
        League::GamePoints.configure(instance)
        Matchday::Iterator.configure(instance, stream: stream, game_iterator: game_iterator)
        Output::Console.configure(instance)
        League::Ranking.configure(instance)
      end
    end

    def self.call(stream)
      instance = build(stream: stream)
      instance.()
    end

    def call
      logger.trace(tag: :run) { "Starting Imp" }

      league = League.new
      day = 1

      matchday_iterator.() do |matchday|
        logger.debug(tag: :run) { "Matchday #{day}" }
        output.("Matchday #{day}")

        matchday.each_game do |game|
          logger.debug(tag: :run) { "Game: #{game}" }

          points = game_points.(game)
          logger.debug(tag: :run) { "Points: #{points.team1}, #{points.team2}" }

          league.assign_points(game.team1, points.team1)
          league.assign_points(game.team2, points.team2)
        end

        ranks = ranking.top(league, 3)
        ranks.each do |rank|
          output.(rank.to_s)
        end

        output.("")
        day += 1
      end

      logger.trace(tag: :run) { "Finishing Imp" }
    end
  end
end
