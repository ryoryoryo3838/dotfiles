# this file is installed as ~/.zprofile for newly created users

# prepend ~/.local/bin and ~/bin to $PATH unless it is already there
if ! [[ "$PATH" =~ "$HOME/bin" ]]
then
    PATH="$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.local/bin:" ]]
then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH

# Created by `pipx` on 2025-08-14 14:16:16
export PATH="$PATH:/var/home/miyax/Documents/OCaml/.local/bin"
