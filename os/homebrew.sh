#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

install() {
  if ! cmd_exists "brew"; then
    ask_for_sudo
    printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null
  fi

  print_result $? "Install"
}

add_to_path() {
  if cmd_exists "brew"; then
    return
  fi

  HARDWARE="$(uname -m)"
  prefix=""

  if [ "$HARDWARE" == "arm64" ]; then
    prefix="/opt/homebrew"
  elif [ "$HARDWARE" == "x86_64" ]; then
    prefix="/usr/local"
  else
    print_error "Homebrew is only supported on Intel and ARM processors!"
  fi

  brew_cmd="$prefix/bin/brew"

  echo 'eval "$('$brew_cmd' shellenv)"' >> "$(HOME)/.zprofile"

  eval "$($brew_cmd shellenv)"

  cmd_exists "brew"
  print_result $? "Add to PATH"
}

update() {
  execute \
    "brew update" \
    "Update"
}

upgrade() {
  execute \
    "brew upgrade" \
    "Upgrade"
}

main() {
  print_in_purple "\n   Homebrew\n\n"

  install
  add_to_path
  update
  upgrade
}

main
