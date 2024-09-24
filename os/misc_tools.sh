#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

main() {
  print_in_purple "\n   Miscellaneous Tools\n\n"

  brew_install "starship" "starship"
  brew_install "lsd" "lsd"
  brew_install "bat" "bat"
  brew_install "ripgrep" "ripgrep"
  brew_install "fd" "fd"
  brew_install "fzf" "fzf"
  brew_install "prettyping" "prettyping"
  brew_install "glances" "glances"
  brew_install "ctop" "ctop"
  brew_install "duf" "duf"
  brew_install "tldr" "tldr"
  brew_install "cmake" "cmake"
  brew_install "tig" "tig"
  brew_install "lazygit" "lazygit"
  brew_install "httpie" "httpie"
  brew_install "fastfetch" "fastfetch"
  brew_install "onefetch" "onefetch"
  # brew_install "Stow" "stow"
}

main
