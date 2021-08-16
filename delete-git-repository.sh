#!/usr/local/bin/zsh

filter_branch() {
  # delete 'hoge' completely from my git history.
  # e.g. hoge is a secret key.
  git filter-branch --tree-filter 'rm -f hoge' HEAD --all
}
reflog_expire() {
  git reflog expire --expire=now --all
}
do_gc() {
  git gc --aggressive --prune=now
}
push_master() {
  git push --force origin master
}

filter_branch && reflog_expire && do_gc && push_master
