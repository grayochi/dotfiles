#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

add_configs() {
  if cmd_exists volta; then
    return
  fi

  execute \
    "echo 'fish_add_path \"$(HOME)/.volta/bin\"' >> $LOCAL_SHELL_CONFIG_FILE" \
    "Update $LOCAL_SHELL_CONFIG_FILE"

}

install() {
  execute \
    "curl https://get.volta.sh | bash -s -- --skip-setup" \
    "Install"
}

main() {
    print_in_purple "\n   Volta\n\n"

    install
    add_configs
}

main
