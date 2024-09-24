#!/usr/bin/env bash

verify_os() {
  if [ "$(uname -s)" == "Darwin" ]; then
    return
  fi

  print_error  "Only support MAC OS X"
  return 0
}

ask_for_sudo() {
  sudo -v &> /dev/null

  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &> /dev/null &
}

cmd_exists() {
  command -v "$1" &> /dev/null
}

print_in_color() {
  printf "%b" \
    "$(tput setaf "$2" 2> /dev/null)" \
    "$1" \
    "$(tput sgr0 2> /dev/null)"
}

print_in_green() {
  print_in_color "$1" 2
}

print_in_purple() {
  print_in_color "$1" 5
}

print_in_red() {
  print_in_color "$1" 1
}

print_in_yellow() {
  print_in_color "$1" 3
}

print_success() {
  print_in_green "   [✔] $1\n"
}

print_error() {
  print_in_red "   [✖] $1 $2\n"
}

print_error_stream() {
  while read -r line; do
    print_error "↳ ERROR: $line"
  done
}

print_warning() {
  print_in_yellow "   [!] $1\n"
}

print_question() {
  print_in_yellow "   [?] $1"
}

print_result() {
  if [ "$1" -eq 0 ]; then
    print_success "$2"
  else
    print_error "$2"
  fi

  return "$1"
}

set_trap() {
  trap -p "$1" | grep "$2" &> /dev/null \
    || trap '$2' "$1"
}

kill_all_subprocesses() {
  local i=""

  for i in $(jobs -p); do
    kill "$i"
    wait "$i" &> /dev/null
  done
}

show_spinner() {
  local -r FRAMES='/-\|'
  local -r NUMBER_OR_FRAMES=${#FRAMES}
  local -r CMDS="$2"
  local -r MSG="$3"
  local -r PID="$1"
  local i=0
  local frameText=""

  printf "\n\n\n"
  tput cuu 3
  tput sc

  while kill -0 "$PID" &>/dev/null; do
    frameText="   [${FRAMES:i++%NUMBER_OR_FRAMES:1}] $MSG"

    printf "%s\n" "$frameText"
    sleep 0.2
    tput rc
  done
}

execute() {
  local -r CMDS="$1"
  local -r MSG="${2:-$1}"
  local -r TMP_FILE="$(mktemp /tmp/XXXXX)"
  local exitCode=0
  local cmdsPID=""

  set_trap "EXIT" "kill_all_subprocesses"

  eval "$CMDS" \
    &> /dev/null \
    2> "$TMP_FILE" &

  cmdsPID=$!

  show_spinner "$cmdsPID" "$CMDS" "$MSG"

  wait "$cmdsPID" &> /dev/null
  exitCode=$?

  print_result $exitCode "$MSG"

  if [ $exitCode -ne 0 ]; then
    print_error_stream < "$TMP_FILE"
  fi

  rm -rf "$TMP_FILE"

  return $exitCode
}

brew_install() {
  declare -r ARGUMENTS="$3"
  declare -r FORMULA="$2"
  declare -r FORMULA_READABLE_NAME="$1"
  declare -r TAP_VALUE="$4"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if `Homebrew` is installed.

  if ! cmd_exists "brew"; then
    print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
    return 1
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # If `brew tap` needs to be executed,
  # check if it executed correctly.

  if [ -n "$TAP_VALUE" ]; then
    if ! brew_tap "$TAP_VALUE"; then
      print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
      return 1
    fi
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Install the specified formula.

  # shellcheck disable=SC2086
  if brew list "$FORMULA" &> /dev/null; then
    print_success "$FORMULA_READABLE_NAME"
  else
    execute \
      "brew install $FORMULA $ARGUMENTS" \
      "$FORMULA_READABLE_NAME"
  fi
}

brew_tap() {
  brew tap "$1" &> /dev/null
}


