#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

main() {
    print_in_purple "\n   GVM\n\n"

    brew_install "mercurial" "mercurial"
    execute \
        "bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)" \
        "Install"

    # source ~/.gvm/scripts/gvm
}

main
