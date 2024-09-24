#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

main() {
  print_in_purple "\n   Miscellaneous\n\n"

  brew_install "Docker" "docker" "--cask"
  brew_install "iTerm2" "iterm2" "--cask"
  brew_install "Rectangle" "rectangle" "--cask"
  brew_install "keycastr" "keycastr" "--cask"
}

main
