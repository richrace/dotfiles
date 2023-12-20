#!/usr/bin/env bash

command_exist() {
  local command="$1"
  command -v "$command" > /dev/null 2> /dev/null
  return $?
}

export DOTFILES_ROOT="$HOME/.dotfiles"

if [[ -d "$DOTFILES_ROOT" ]]; then
  echo "Already installed."
  exit
fi

if ! command -v xcode-select >/dev/null; then
  echo "Looks like we need to install xcode cli tools..."

  xcode-select --install
fi

if ! command_exist brew; then
  echo "Installing Homebrew ..."

  curl -fsS 'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

if ! command_exist git; then
  echo "Installing git..."

  if command_exist apt-get; then
    sudo apt-get install --yes git
  elif command_exist brew; then
    brew install git
  else
    echo "Cannot install git. Aborting."
    exit 1
  fi
fi

git clone --recurse-submodules git@github.com:richrace/dotfiles.git "$DOTFILES_ROOT"

"$DOTFILES_ROOT/bin/dotfiles-sync"
"$DOTFILES_ROOT/bin/install-apps"

echo "Done."
