#!/usr/local/bin/zsh

# check VSCode install
echo "Did you install VSCode, and can you use 'code' command?"
echo "(y/n)"
if ! read -q; then
  echo "\nabort process"
  return 0
fi
echo "\n"

VSCODE_EXTENSIONS_LIST_DIR=~/.vscode/.vscode_extensions_list

cat $VSCODE_EXTENSIONS_LIST_DIR | while read line; do
  code --install-extension $line
done

code --list-extensions > $VSCODE_EXTENSIONS_LIST_DIR
