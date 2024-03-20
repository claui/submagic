# Contributing to Submagic

## Setting up Submagic for development

To set up Submagic for development, you need
Bash and Shellcheck installed on your system.

## Generating the man page

To generate the man page, run:

```shell
sphinx-build -aqEW -b man doc/sphinx build/man
```

Note: This requires the `myst-parser` and `sphinx` Python packages
to be installed.

To open the generated man page, run:

```shell
man build/man/submagic.1
```

## Running the linter

To execute the linter, run:

```shell
shellcheck bin/* libexec/*.bash
```
