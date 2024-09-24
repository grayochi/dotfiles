#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

main() {
  print_in_purple "\n   Git\n\n"

  brew_install "Git" "git"
  brew_install "GitHub CLI" "gh"
}

main
