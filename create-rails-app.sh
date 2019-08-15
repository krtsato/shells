#!/usr/local/bin/zsh

# Create a new Rails App

# Must : $1
if [ "$1" = "" ]; then
  echo "Set the argument which means your AppName."
  return 1
fi

# Skip  : bundle, action cable, javascript, action mailer, sprockets, minitest, coffee script, turbolinks
# Add   : webpack
bundle exec rails new $1 -d postgresql -BCJMST --skip-coffee --skip-turbolinks --webpack --api

rm -f Gemfile
rm -f Gemfile.lock
rm -rf .bundle
rm -rf vendor/bundle

cd $1
bundle install --path vendor/bundle --jobs=4
