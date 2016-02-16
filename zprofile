
export DOTFILES_ROOT="$HOME/.dotfiles"

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

path=($path "$DOTFILES_ROOT/bin")

if [[ -d "$HOME/bin" ]]; then
  path=($path "$HOME/bin")
fi
