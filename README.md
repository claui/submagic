# Submagic

A tiny utility that redirects stdin into a temporary file and then
prints the full path to that file.

It helps you in situations where you’d like to feed the output of a
program `foo` into another program `bar`, but `bar` only accepts a
file name as an argument and refuses to work with standard input or
Bash’s process substitution.

In other words, `submagic` allows you to run a shell command line like:

```shell
foo | submagic | xargs bar
```

if `foo` emits standard output but `bar` only accepts files.

This is the solution for the question
[Creating a temporary file from standard input](https://unix.stackexchange.com/q/495254)
on Unix Stack Exchange.

## Installation

### Installing manually

Clone this repository to any directory you like.

### Installing from the AUR

Direct your favorite
[AUR helper](https://wiki.archlinux.org/title/AUR_helpers) to the
`submagic` package.

## Usage

See [`USAGE.md`](https://github.com/claui/submagic/blob/main/USAGE.md) for details.

## Contributing to Submagic

See [`CONTRIBUTING.md`](https://github.com/claui/submagic/blob/main/CONTRIBUTING.md).

## Credits

Credits go to user k.stm – the author of the original `submagic`
[question](https://unix.stackexchange.com/q/495254) – and to numerous
other users who came up with a solution for it.

## License

Copyright (c) 2024 Claudia Pellegrino

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
For a copy of the License, see [LICENSE](LICENSE).
