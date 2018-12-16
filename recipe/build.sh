#!/usr/bin/env bash

build_unix()
{
    pushd src/github.com/coredns/coredns
    make

    mkdir -p $PREFIX/bin
    cp coredns $PREFIX/bin
}

case $(uname -s) in
    "Linux"|"Darwin")
        build_unix
        ;;
    *)
        exit 1
        ;;
esac
