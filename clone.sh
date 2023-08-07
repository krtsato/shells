#!/bin/bash -eu

ORG=$1
SSH_HOST="github.com"
REPOS=( \
  eheya-data-analytics-batch \
  eheya-data-analytics-cost \
  eheya-data-analytics-data-api \
  eheya-data-analytics-data-bridge \
  eheya-data-analytics-data-management \
  eheya-data-analytics-secure-data \
  eheya-data-analytics-tools \
  eheya-data-monitoring \
  red-frasco-ad-repo \
  aws-infra-eheya
)

if [ "$ORG" = "red-frasco" ]; then
  SSH_HOST="github.com.red"
fi

for i in "${!REPOS[@]}"; do
  git clone "git@$SSH_HOST:$ORG/${REPOS[$i]}.git"
done
