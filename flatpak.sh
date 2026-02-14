# Add home-manager
if [ ! $(command -v home-manager ) ]; then
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
fi


source $HOME/.zshrc
home-manager switch
