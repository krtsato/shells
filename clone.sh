#!/bin/bash -eu

ORG=$1
REPOS=( \
  foo \
  bar \
)

for i in "${!REPOS[@]}"
do
  git clone "git@github.com:$ORG/${REPOS[$i]}.git"
done
