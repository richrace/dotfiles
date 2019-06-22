
export DOTFILES_ROOT="$HOME/.dotfiles"

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

path=($path "$DOTFILES_ROOT/bin")

if [[ -d "$HOME/bin" ]]; then
  path=($path "$HOME/bin")
fi
