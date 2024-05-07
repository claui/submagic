<!-- markdownlint-configure-file { "MD041": { "level": 1 } } -->
<!-- markdownlint-configure-file { "MD024": { "siblings_only": true } } -->

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

# Example 1

This example depends on the [`jq`](https://jqlang.github.io/jq/) and
[`jsonoid`](https://github.com/dataunitylab/jsonoid-discovery/blob/main/README.md) packages.

## With submagic

To feed regular JSON (i.e. JSON input that is not newline-delimited)
into the `jsonoid` tool:

```bash
jq -c . input.json | submagic | xargs jsonoid
```

## Without submagic

Without submagic, you’d have to break your command pipeline into
two parts because `jsonoid` only accepts files as input:

```bash
jq -c . input.json > /tmp/annoying.tempfile
jsonoid /tmp/annoying.tempfile
```

# Example 2

This example depends on the
[`0x0uploader`](https://codeberg.org/MorsMortium/0x0uploader)
package.

## With submagic

To send the systemd journal output of `example.service` directly
to the [0x0](https://0x0.st) file-hosting service:

```bash
$ journalctl -u example.service --since='5 min ago' \
  | submagic x.log \
  | xargs 0x0uploader
0x0Uploader: File uploaded, url: https://0x0.st/oaxK.txt
```

## Without submagic

Without submagic, you’d have to break your command pipeline into
at least two parts because `0x0uploader` only accepts files:

```bash
journalctl -u example.service --since='5 min ago' > /tmp/x.log
0x0uploader /tmp/x.log
```

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
