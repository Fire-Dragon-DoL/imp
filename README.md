# Imp

## Usage

All commands must be executed from the root directory of the project.

Export `LOG_LEVEL=_none` to prevent the logger from polluting the screen:

```bash
export LOG_LEVEL=_none
```

### Installation from Release

Install the gem by downloading it from the release page and install it with
the following command

```bash
gem install imp-1.1.0.gem
```

The software can now be executed by typing:

```bash
imp
```

### Installation from Project directory

Alternatively, once this project has bin downloaded, `cd` into the project
and run the following commands:

```bash
bundle install
bundle exec ruby ./exe/imp
```

Or you can install the gem from the project directory with:

```bash
bundle install
bundle exec rake install
```

Then the software can be executed by running:

```bash
imp
```

### Usage within other Ruby code

It's possible to use `imp` within other Ruby code:

```ruby
require "imp"

Imp::Run.(stream: StringIO.new("some data"))
```

## Running the test suite

Alternatively, once this project has bin downloaded, `cd` into the project
and run the following commands:

```bash
bundle install
LOG_LEVEL=_none bundle exec bench 'test/automated'
```

## Running interactive tests

Interactive tests exercise `imp` by passing samples stored in
`lib/imp/controls/samples`. These are meant to be exercised by a human and
provide no affordance to verify the software output.
The goal is for a human to inspect the output and determine the correctness
of it.
To exercise all the interactive tests, the following commands can be executed
from the project root directory:

```bash
./test/interactive/actuate/sample_01
./test/interactive/actuate/sample_02
./test/interactive/actuate/sample_03
./test/interactive/actuate/sample_04
./test/interactive/actuate/file_arg
./test/interactive/actuate/two_file_args
./test/interactive/actuate/redirect
```

## Choices

### Ruby as programming language

Ruby was born to be a better scripting language. Essentially, a competitor for
Bash. Given that the challenge is focused on interactions with the shell, this
programming language seems to be the best tool for the job.

### Delivery as a `gem`

The choice of using a gem is to ease the experience of the developers that are
going to review the challenge. They will be able to easily execute the software
with an executable file provided with the gem: `imp`, providing a better
developer experience.

### Useful Objects

To achieve behavioral object isolation, the doctrine of
[Useful Objects](http://docs.eventide-project.org/user-guide/useful-objects.html) is followed. The adoption is eased through the gems `evt-dependency` and
`evt-configure`.

### Over-engineering

This project is, of course, over-engineered. Given the business requirements
and the business relationship, a single script file would suffice.
The purpose of this project is to show how I would manage an important piece
of production quality code in an ongoing project.

## Improvements

- Team and Score samples moved outside of `Parse` namespace
- Proper formatter object for `Rank` rendering

## Assumptions

- Stream is not a CSV
- Teams can't use the "comma" character in the name
- No escaping with quotes
- Points is plural for 0 (`0 pts`) and singular only for `1`
- Last empty line of the output not relevant
- Last matchday will be included in the scoring even if incomplete (e.g. not all teams played, suspended day)
  - It will not be printed if no one played
- Bash is used for all command-line instructions in this README

## Alternatives to the design

One approach that would fit well this project is a stream-based pipeline.
In Elixir (Ruby lacks some of the primitives) the `Run` module would look like
the following (sudo code):

```elixir
def run(stream)
  new_league = %League{}

  stream
  |> Stream.map(&parse_game)
  |> Stream.filter(fn game -> !is_nil(game) end)
  |> Stream.transform(&into_matchdays)
  |> Enum.reduce(new_league, fn matchday, league ->
    league = League.assign_points_per_matchday(matchday)
    print_ranks(league)
    league
  end)
```
