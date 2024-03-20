<!-- markdownlint-configure-file { "MD041": { "level": 1 } } -->

# Synopsis

```shell
foo | submagic [NAME] | xargs bar
```

# Description

`submagic` is a tiny utility that redirects stdin into a temporary file and then prints the full path to that file.

It helps you in situations where you’d like to feed the output of a program `foo` into another program `bar`, but `bar` only accepts a file name as an argument and refuses to work with standard input or Bash’s process substitution.

In other words, `submagic` allows you pipe the stdout of `foo` into `bar` even though `bar` only accepts files.

`submagic` is a solution for the question [Creating a temporary file from standard input](https://unix.stackexchange.com/q/495254) on Unix Stack Exchange.

# Positional parameters

`NAME` is an optional base name for the temporary file that `submagic` will create.

If `NAME` is given, `submagic` will create a temporary directory that ends in `.submagic` and create a file with the desired name inside that directory. This is useful for cases where the receiving tool imposes restrictions on filenames it accepts.

If `NAME` is not given, `submagic` will simply create a temporary file whose name ends in `.submagic`.

# Options

Only one flag is supported, `-V`/`--version`, which prints the version number and exits.

# Return value

The program prints the name of the temporary file after the standard input has been completely written to it.

# Notes

## Cleaning up

`submagic` never cleans up the temporary files it creates. This is deliberate, because `submagic` cannot know in advance for how long the rest of the command pipeline is going to need the file.

You may want to clean up your `/tmp` directory regularly, for example by running:

```sh
rm -rfv /tmp/*.submagic
```

## Etymology

The name `submagic` was chosen for the program because the author of the original problem also called it `submagic` in their example.

# See also

The original `submagic` question:

<https://unix.stackexchange.com/q/495254>
