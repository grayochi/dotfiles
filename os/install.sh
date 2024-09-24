#! /usr/bin/env bash

main() {
  cd "$(dirname "${BASH_SOURCE[0]}")" \
    || exit 1

  if [ -x "utils.sh" ] ;then
    . "utils.sh"
  fi

  verify_os \
    || exit 1

  ask_for_sudo

  # ./xcode.sh
  ./homebrew.sh
  # ./fish.sh
  # ./git.sh
  # ./neovim.sh
  # ./tmux.sh
  # ./browser.sh

  # ./volta.sh
  # ./gvm.sh
  ./pyenv.sh

  # ./misc.sh
  # ./misc_tools.sh
}

main "@"
