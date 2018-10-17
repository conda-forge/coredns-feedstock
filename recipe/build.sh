#!/usr/bin/env bash
GOPATH=$SRC_DIR
ORG_PATH="github.com/coredns"

git_init()
{
    git init
    git config --local user.email "conda-forge@googlegroups.com"
    git config --local user.name "conda-forge"
    git add conda_build.sh
    git commit -m "conda build of $PKG_NAME-v$PKG_VERSION"
    git tag v${PKG_VERSION}
}

build_unix()
{
    cd src/${ORG_PATH}/${PKG_NAME}
    make CHECKS= godeps all

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
