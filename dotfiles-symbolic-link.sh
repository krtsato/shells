#!/usr/local/bin/zsh

# check additional array store
echo "Have you done these tasks?
・setup zsh, VSCode and Hyper
・add new dotfiles' name to the array of this script
・set new 'settings.json' and 'keybindings.json' of VSCode
・quit Hyper and start this script from terminal.app
(y/n)"

if ! read -q ; then
  echo "\nabort process"
  return 0
fi
echo "\n"

# create Brewfile
brew bundle dump --force

# create vscode's extensions list
VSCODE_EXTENSIONS_LIST_DIR=~/.vscode/.vscode_extensions_list
code --list-extensions > $VSCODE_EXTENSIONS_LIST_DIR

# additional associcative array, [key]=value
# note : if you will make a directory link, add "/" to the last of keyname.
local -A dot_files_dirs=(
  [Brewfile]=~/Brewfile
  [.gitconfig]=~/.gitconfig
  [.hyper.js]=~/.hyper.js
  [.hyper_plugins/]=~/.hyper_plugins
  [keybindings.json]=~/Library/Application\ Support/Code/User/keybindings.json
  [settings.json]=~/Library/Application\ Support/Code/User/settings.json
  [.vscode_extensions_list]=$VSCODE_EXTENSIONS_LIST_DIR
  [.zcompdump]=~/.zcompdump
  [.zshrc]=~/.zshrc
)

# move dotfiles and create symbolic links from array store
for name origin_dir in ${(kv)dot_files_dirs}; do
  mv -f $origin_dir ~/dotfiles/
  ln -fnsv ~/dotfiles/$name $origin_dir
  echo "\n"
done
