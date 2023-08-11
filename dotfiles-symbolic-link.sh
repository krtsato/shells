#!/opt/homebrew/bin/zsh

# check additional array store
echo "Have you done these tasks?
- setup zsh, VSCode
- add new dotfiles' name to the array of this script
- set new 'settings.json' and 'keybindings.json' of VSCode
- start this script from terminal.app
(y/n)"

if ! read -q ; then
  echo "\nabort process"
  return 0
fi

# create Brewfile
# brew bundle dump --force --file ~/awa.brewfile
# brew bundle dump --force --file ~/gnc.brewfile
# brew bundle dump --force --file ~/red.brewfile

# create vscode's extensions list
VSCODE_EXTENSIONS_LIST_DIR=~/.vscode/.vscode_extensions_list
code --list-extensions > $VSCODE_EXTENSIONS_LIST_DIR

# additional associcative array, [key]=value
# Note: if you will make a directory link, add "/" to the last of keyname.
local -A dot_files_dirs=(
  # [awa.brewfile]=~/awa.brewfile
  # [gnc.brewfile]=~/gnc.brewfile
  # [red.brewfile]=~/red.brewfile
  [.gitconfig]=~/.gitconfig
  # [.gitconfig.catools]=~/.gitconfig.catools
  # [.gitconfig.awa]=~/.gitconfig.awa
  # [.gitconfig.gnc]=~/.gitconfig.gnc
  # [.gitconfig.red]=~/.gitconfig.red
  [.gitignore.global]=~/.gitignore.global
  [.fig/settings.json]=~/.fig/settings.json
  [karabiner/]=~/.config/karabiner
  [Alfred/]=~/Library/Application\ Support/Alfred
  [keybindings.json]=~/Library/Application\ Support/Code/User/keybindings.json
  [settings.json]=~/Library/Application\ Support/Code/User/settings.json
  [.vscode_extensions_list]=$VSCODE_EXTENSIONS_LIST_DIR
  [.zcompdump]=~/.zcompdump
  [.zshrc]=~/.zshrc
)

local dist_dir=~/engr/me/dotfiles

# move dotfiles and create symbolic links from array store
for name origin_dir in ${(kv)dot_files_dirs}; do
  # mv -f $origin_dir $dist_dir/
  ln -fnsv $dist_dir/$name $origin_dir
  echo "\n"
done
