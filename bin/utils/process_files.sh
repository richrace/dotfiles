#!/usr/bin/env bash

process_file() {
  [[ $filename == 'README.md' ]] && continue
  [[ $filename == 'LICENCE.md' ]] && continue

  file_in_dotfiles="$PWD/$filename"

  if [ $filename == "spaceship.zsh" ]; then
    if [ -e "$HOME/.config/spaceship.zsh" ]; then
      if [ -L "$HOME/.config/spaceship.zsh" ]; then
        okay "\t$filename already symlinked"
      else
        warning "$HOME/.config/spaceship.zsh exists but is not a symlink."
      fi
    else
      create_symlink $file_in_dotfiles "$HOME/.config/spaceship.zsh"
    fi

    continue
  fi

  if [ $filename == "coffelint.json" ] || [ $filename == "svn_vimdiff.sh" ]; then
    file_in_home="$HOME/$filename"
  else
    file_in_home="$HOME/.$filename"
  fi

  if [[ -e $file_in_home ]]; then
    if [[ -L $file_in_home ]]; then
      okay "\t$filename already symlinked"
    else
      warning "$file_in_home exists but is not a symlink."
    fi
  else
    create_symlink $file_in_dotfiles $file_in_home
  fi
}

process_files() {
  printf "\n\nAbout to begin processing files...\n"

  for filename in *; do
    [[ -f $filename ]] || continue

    filename="$(basename "$filename")"

    process_file $filename
  done

  printf "\nDone processing files.\n"
}
