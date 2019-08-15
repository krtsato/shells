#!/usr/local/bin/zsh

# Detail : https://bit.ly/2OTwChQ

uninstall() {
  list=$(gem list --no-versions)
  for gem in $list; do
    gem uninstall $gem -aIx
  done
  gem list
  gem install bundler
}

# rbenv versions --bare
RBENVPATH=$(rbenv root)
echo $RBENVPATH
RUBIES=$(ls $RBENVPATH/versions)
for ruby in $RUBIES; do
  echo '---------------------------------------'
  echo "Ruby : \"$ruby\""
  rbenv local $ruby
  uninstall
done
