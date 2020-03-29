# shell-tools

POSIX shell tools for continuous integration (and other things)!

## Usage

### runtests

**runtests** will execute SCRIPT in each of the directories DIRS
and will return non-zero (fail) if any SCRIPT fails.

The SCRIPT could be an executable in the PATH, or an executable
relative to the directory (e.g. `./dut.py`) or a shell script
to be given to `sh -e -c SCRIPT` (_NOTE_ within SCRIPT the
variable **d** is set to the directory and the variable **i** is
set to the current number of the test running.

```
usage: runtests [OPTIONS] DIRS
       OPTIONS
           [-v,--verbose]        verbose
           [-h,--help]           help
           [-c,--script] SCRIPT  prog-or-script
       DIRS                      one or more directories to test
```

### get-ci

**get-ci** is a complement to your CI infrastructure. It can
be used to track which submodules changed when a build failed.
Typically you would run `get-ci --before` prior to running
tests and `get-ci --after $?` after running tests.

```
usage: git-ci [OPTIONS]
       OPTIONS
           [-a,--after] RESULT   test result status
           [-A,--notify-add] SUB EMAIL add notifications for submodule
           [-b,--before]         record versions before test
           [-c,--changes]        show version changes
           [-C,--current]        show current versions
           [-D,--notify-delete] SUB EMAIL delete notifications for submodule
           [-h,--help]           help
           [-l,--list]           list submodules
           [-L,--notify-list] SUB...  list notifications for submodule(s)
           [-n,--notify]         send notifications on failure
           [-p,--prev]           show previous versions
           [-v,--verbose]        verbose
```

#### list submodule notifications

`git-ci --notify-list $(git-ci --list)`

#### add a submodule notification

`git-ci --verbose --notify-add deps/litex me@gmail.com`

#### delete a submodule notification

`git-ci --verbose --notify-delete deps/litex me@gmail.com`

### exitwith

```
usage: exitwith [OPTIONS] exit-code
       OPTIONS
           [-v,--verbose]        verbose
           [-h,--help]           help
       exit-code                 integer to use as the exit code
```

## Testing

_TBD_

## Contribution Guidelines

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

Please see [CONTRIBUTING](CONTRIBUTING.md) for details on
how to make a contribution.

Please note that this project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide its terms.

## License

Copyright © 2019

Licensed under the [GPL-3.0](https://opensource.org/licenses/GPL-3.0) [LICENSE](LICENSE)
