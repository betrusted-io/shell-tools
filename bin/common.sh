#!/bin/sh
# common.sh
# common shell functions
# this file is intended to be source by other shell programs
# print arguments to STDOUT

log() {
    echo "$*"
}

# cat file(s) to STDOUT
catlog() {
    cat "$*"
}

# print arguments to STDERR
err() {
    echo >&2 "$*"
}

# cat file(s) to STDERR
caterr() {
    cat "$*" >&2
}

# print arguments to STDOUT if verbose
vlog() {
    [ -z "$verbose" ] || [ $verbose -lt 1 ] || log "$*"
}

# cat file(s) to STDOUT if verbose
vcatlog() {
    [ -z "$verbose" ] || [ $verbose -lt 1 ] || catlog "$*"
}

# print arguments to STDERR if verbose
verr() {
    [ -z "$verbose" ] || [ $verbose -lt 1 ] || err "$*"
}

# print arguments to STDERR if verbose >= 2
vverr() {
    [ -z "$verbose" ] || [ $verbose -lt 2 ] || err "$*"
}

# cat file(s) to STDERR if verbose
vcaterr() {
    [ -z "$verbose" ] || [ $verbose -lt 1 ] || caterr "$*"
}

# check that these variables are set
checkvars() {
    local errors=0
    for var in $*; do
        if [ -z "$(eval echo \$$var)" ]; then
            err "please set variable: $var"
            errors=$(($errors + 1))
        fi
    done
    if [ $errors -gt 0 ]; then
        return 1
    fi
    return 0
}


# print the variable values
printvars() {
    for var in $*; do
        value="$(eval echo \$$var)"
        if [ -z "$value" ]; then
            err "$var UNSET"
        else
            err "$var=$value"
        fi
    done
}

# returns the number of argumets
args_size() {
    echo $#
}

# returns true if WORD is a member of ARGS
member_of() {
    [ $# -lt 2 ] && err "usage: member_of WORD ARGS..." && return 1
    local word="$1"
    local member=1
    local arg
    shift
    for arg in $*; do
        if [ "$arg" = "$word" ]; then
            return 0
        fi
    done
    return $member
}

# removes WORD from ARGS
remove_arg() {
    [ $# -lt 2 ] && err "usage: remove_arg WORD ARGS..." && return 1
    local word="$1"
    local member=1
    local arg
    local args=""
    shift
    for arg in $*; do
        if [ "$arg" != "$word" ]; then
            if [ -z "$args" ]; then
                args="$arg"
            else
                args="$args $arg"
            fi
        fi
    done
    echo $args
    return 0
}
