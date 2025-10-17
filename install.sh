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

### Shell
ln -sf $HOME/dotfiles/shell/bashrc $HOME/.bashrc
ln -sf $HOME/dotfiles/shell/zshrc $HOME/.zshrc
# sheldon
ln -sf $HOME/dotfiles/sheldon/ $HOME/.config/

# source $HOME/.zshrc
eval "$(devbox global shellenv --preserve-path-stack -r)"
hash -r

#git
ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

### symlink
# .config
stow -d $HOME/dotfiles -t $HOME/.config/ config
