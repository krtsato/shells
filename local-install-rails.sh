#!/usr/local/bin/zsh

# install Rails in local directory
cat <<EOS >Gemfile
source "http://rubygems.org"
gem 'rails', '5.2.3'
EOS

bundle install --path vendor/bundle --jobs=4
