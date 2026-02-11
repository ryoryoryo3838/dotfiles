### DEVBOX setting
# devbox check
if [ ! $(command -v devbox ) ]; then
  echo "devbox not installed"
  exit 1
fi

# sym global config
DEV_GLOBAL_DIR="$HOME/.local/share/"

rm "$DEV_GLOBAL_DIR/devbox" -r

ln -sf $HOME/dotfiles/devbox $DEV_GLOBAL_DIR

# dots
ln -sf $HOME/dotfiles/dots/bashrc $HOME/.bashrc
ln -sf $HOME/dotfiles/dots/zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/dots/wezterm.lua $HOME/.wezterm.lua
# Shell
ln -sf $HOME/dotfiles/shell/rm.sh $HOME/rm.sh
# sheldon
ln -sf $HOME/dotfiles/sheldon/ $HOME/.config/

# source $HOME/.zshrc
eval "$(devbox global shellenv --preserve-path-stack -r)"
hash -r

#git
ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

### symlink
# .config
stow -d $HOME/dotfiles -t $HOME/.fonts/ fonts
stow -d $HOME/dotfiles -t $HOME/.config/ config
