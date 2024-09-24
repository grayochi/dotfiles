#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

main() {
  print_in_purple "\n   tmux\n\n"

  brew_install "tmux" "tmux"
  brew_install "Pasteboard" "reattach-to-user-namespace"
}

main
