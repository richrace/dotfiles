#!/usr/bin/env bash

process_folders() {
  printf "\n\nAbout to begin processing folders...\n"

  folders_to_link=(vim oh-my-zsh)

  for folder in "${folders_to_link[@]}"; do
    if [[ -e "$HOME/.$folder" ]]; then
      if [[ -L "$HOME/.$folder" ]]; then
        okay "\t$folder is already symlinked"
      else
        warning ".$folder already exists in $HOME and is not a symlink"
      fi
    else
      create_symlink "$PWD/$folder" "$HOME/.$folder" " folder"
    fi
  done

  printf "\nDone processing folders.\n"
}
