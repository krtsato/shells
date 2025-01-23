#!/bin/bash -eu

ORG=$1
SSH_HOST="github.com"
REPOS=( \
  discovery-api \
  s.awa.fm \
  your-trends-2022 \
  account-web \
  liverpool-webplayer-v2 \
  image-subscriber \
  db-sync \
  meta-sync \
  playlist-subscriber \
  liverpool-batch \
  meta \
  liverpool-oauth2 \
  node-cross-site-session \
  liverpool-notification \
  liverpool-proto \
  liverpool-js-proto \
  liverpool-ios-proto \
  liverpool-android-v2 \
  liverpool-tag \
  live-audio \
  liverpool-audio-subscriber \
  comment \
  comment-subscriber \
  logger-api
)

if [ "$ORG" = "red-frasco" ]; then
  SSH_HOST="github.com.red"
fi

for i in "${!REPOS[@]}"; do
  git clone "git@$SSH_HOST:$ORG/${REPOS[$i]}.git"
done
