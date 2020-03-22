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
