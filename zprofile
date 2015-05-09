
export DOTFILES_ROOT="$HOME/.dotfiles"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

path=("$DOTFILES_ROOT/bin" $path)

if [[ -d "$HOME/bin" ]]; then
  path=("$HOME/bin" $path)
fi
