#!/bin/sh

set -eux

PROJECT_ROOT="/go/src/github.com/${GITHUB_REPOSITORY}"

mkdir -p $PROJECT_ROOT
rmdir $PROJECT_ROOT
ln -s $GITHUB_WORKSPACE $PROJECT_ROOT
cd $PROJECT_ROOT/apps/client
go get -v ./...

EXT=''

if [ "${GOOS}" == 'windows' ]; then
EXT='.exe'
fi

OUTPUT=`./build.sh`

echo -n "${OUTPUT}"
