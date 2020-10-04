# Planning

## Decide later how the sorting is done

## Decide later how to identify the start and end of the mathday

- Streamed Assembly Line where matchday represent the response

## Core

```ruby
class Outer
  def call(stream)
    stream.each do |entry|
      ok, match = parse.(entry)

      next if !ok

      matchday = something.play(match)

      if matchday.ended?
        output.(matchday)
      end

      # The 1 matchday case breaks the design. How to address it?
    end
  end
end

input = ARGF.each_line

# class Game::Iterator.(input)
stream = input.
  lazy.
  select { |entry| Input::Validate.(entry) }.
  map { |entry| Parse.(entry) }

# ---

# class Matchday::Iterator.() do
matchday = Matchday.new
# League?
# Game::Iterator.(input) do |game|
  if matchday.team_played?(game.team1)
    matchday.finish
    yield matchday
    matchday = Matchday.new
  end
  matchday.play(game)
# end
if matchday.played? && matchday.ongoing?
  matchday.finish
  yield matchday # if matchday.unplayed? It's not iterated over
end

```

## Why a matchday can end?

- it can end because the next day has started (necessary for the first one)
- it can end because you know that it has ended (league size / 2  == number of matches in a matchday)
  - This might be useless
- it can end because the file has ended. Of course if there is a single matchday I have to presume that is a full matchday
