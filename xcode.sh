#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

are_xcode_command_line_tools_installed() {
    xcode-select -p &> /dev/null
}

install_xcode_command_line_tools() {
  xcode-select --install &> /dev/null

  execute \
    "until are_xcode_command_line_tools_installed; do \
      sleep 5; \
      done" \
    "Install Xcode Command Line Tools"
}

main() {
  print_in_purple "   Xcode\n\n"

  install_xcode_command_line_tools
}

main
