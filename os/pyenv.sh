#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

main() {
  print_in_purple "\n   Pyenv\n\n"

  brew_install "Pyenv" "pyenv"
  brew_install "Virtualenv" "pyenv-virtualenv"
}

main
