#!/usr/bin/env bash

warning() {
  local message="$1"
  printf "\t\e[33m${message}\e[0m\n"
}

okay() {
  local message="$1"
  printf "\t\e[36m${message}\e[0m\n"
}

success() {
  local message="$1"
  printf "\t\e[32m${message}\e[0m\n"
}

create_symlink() {
  success "\tCreating symlink$3 at $2"
  ln -s "$1" "$2"
}
