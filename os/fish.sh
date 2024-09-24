#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "./utils.sh"

add_configs() {
  if cmd_exists "fish" &> /dev/null; then
    return
  fi

  sudo sh -c "echo $(which fish) >> /etc/shells"

  sudo chsh -s $(which fish)
}

main() {
  print_in_purple "\n   Fish Shell\n\n"

  brew_install "Fish shell" "fish"

  add_configs
  
  execute \
    "fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher'" \
    "Fisher"

  # fisher install PatrickF1/fzf.fish
}

main
