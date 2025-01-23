#!/bin/bash -eu

SSH_KEY_PATH=${1:-""}
SSH_TEST_HOST=${2:-""}

if [ ! -f "$SSH_KEY_PATH" ]; then
  echo "required SSH key path"
  exit 1
fi

if [ "$SSH_TEST_HOST" == "" ]; then
  echo "required SSH test host"
  exit 1
fi

eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain "$SSH_KEY_PATH"
ssh -T "$SSH_TEST_HOST"
