#!/opt/homebrew/bin/zsh

# old shebang
#!/usr/local/bin/zsh

# check additional array store
echo "Have you done these tasks?
- setup zsh, VSCode and Hyper
- add new dotfiles' name to the array of this script
- set new 'settings.json' and 'keybindings.json' of VSCode
- start this script from terminal.app
(y/n)"

if ! read -q ; then
  echo "\nabort process"
  return 0
fi

# create Brewfile
# brew bundle dump --force --file ~/job.brewfile
brew bundle dump --force --file ~/gnc.brewfile

# create vscode's extensions list
VSCODE_EXTENSIONS_LIST_DIR=~/.vscode/.vscode_extensions_list
code --list-extensions > $VSCODE_EXTENSIONS_LIST_DIR

# additional associcative array, [key]=value
# note : if you will make a directory link, add "/" to the last of keyname.
local -A dot_files_dirs=(
  #[job.brewfile]=~/job.brewfile
  [gnc.brewfile]=~/gnc.brewfile
  [.gitconfig]=~/.gitconfig
  #[.gitconfig.awa]=~/.gitconfig.awa
  #[.gitconfig.catools]=~/.gitconfig.catools
  #[.gitignore.global]=~/.gitignore.global
  [.gitconfig.gincoinc]=~/.gitconfig.gincoinc
  #[.fig/settings.json]=~/.fig/settings.json # FIXME: The same filename overwrites VSCode settings,json
  [karabiner/]=~/.config/karabiner
  [Alfred]=~/Library/Application\ Support/Alfred
  [keybindings.json]=~/Library/Application\ Support/Code/User/keybindings.json
  [settings.json]=~/Library/Application\ Support/Code/User/settings.json
  [.vscode_extensions_list]=$VSCODE_EXTENSIONS_LIST_DIR
  [.zcompdump]=~/.zcompdump
  [.zshrc]=~/.zshrc
)

local dist_dir=~/engr/myrepo/dotfiles

# move dotfiles and create symbolic links from array store
for name origin_dir in ${(kv)dot_files_dirs}; do
  mv -f $origin_dir $dist_dir/
  ln -fnsv $dist_dir/$name $origin_dir
  echo "\n"
done
