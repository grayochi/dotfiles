#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "./utils.sh"

main() {
  print_in_purple "\n   NeoVim\n\n"

  brew_install "Neovim" "neovim"
}

main
