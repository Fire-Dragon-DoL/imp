# Imp

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

## Useful Objects

To achieve behavioral object isolation, the doctrine of
[Useful Objects](http://docs.eventide-project.org/user-guide/useful-objects.html) is followed. The adoption is eased through the gems `evt-dependency` and
`evt-configure`.

## Assumptions

- Stream is not a CSV
- Teams can't use the "comma" character in the name

## Development

All commands must be executed from the root directory of the project
