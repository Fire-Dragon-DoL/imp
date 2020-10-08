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
gem install imp-1.0.0.gem
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

## Running the test suite

Alternatively, once this project has bin downloaded, `cd` into the project
and run the following commands:

```bash
bundle install
LOG_LEVEL=_none bundle exec bench 'test/automated'
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

## Improvements

- Team and Score samples moved outside of `Parse` namespace
- Proper formatter object for `Rank` rendering

## Assumptions

- Stream is not a CSV
- Teams can't use the "comma" character in the name
- No escaping with quotes
- Points is plural for 0 (`0 pts`) and singular only for `1`
- Last empty line of the output not relevant
- Last matchday will be printed even if incomplete (e.g. suspended)
- Bash is used for all command-line instructions in this README
