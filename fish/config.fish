eval "$(/opt/homebrew/bin/brew shellenv)"

fish_add_path "$HOME/.volta/bin"
fish_add_path "$HOME/.pyenv/bin"

pyenv init - | source
pyenv virtualenv-init - | source
starship init fish | source
