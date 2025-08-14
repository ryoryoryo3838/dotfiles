### ZSHの設定 ###

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
ZSH_CUSTOM=$ZSH/custom/
plugins=(
	git 
	copyfile
	copypath
	zsh-bat
	zsh-autosuggestions
	zsh-syntax-highlighting
)


### User configuration

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch notify 
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/var/home/miyax/.zshrc'
# .zcompdumpの場所を~/.cache/zshに変更
zcompdir="$HOME/.cache/zsh"
export ZSH_COMPDUMP="$zcompdir/.zcompdump-$HOST"
if [[ ! -d "$zcompdir" ]]; then
	mkdir "$zcompdir"
fi
autoload -Uz compinit
compinit -d "$zcompdir/.zcompdump"

# End of lines added by compinstall

# oh-my-zshの読み込み

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> $HOME/.bashrc

### ZSHの設定終わり

# load pyenv if existed
if [ -d $HOME/.pyenv ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init - zsh)"
fi

export EDITOR=nvim
eval "$(direnv hook zsh)"


chpwd() {
    # カレントディレクトリがDistroboxの対象ディレクトリでない場合に、
    # かつDistroboxセッション内にいる場合にexitする
    if [[ "$PWD" != "/path/to/your/project" && -n "$DISTROBOX_HOST_ID" ]]; then
        echo "Exiting Distrobox session..."
        exit
    fi
}
