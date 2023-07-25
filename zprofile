
export DOTFILES_ROOT="$HOME/.dotfiles"

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

path=($path "$DOTFILES_ROOT/bin")

if [[ -d "$HOME/bin" ]]; then
  path=($path "$HOME/bin")
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
