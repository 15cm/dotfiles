#!/bin/bash

cmd_exists () {
  command -v $1 > /dev/null
}

if  [[ "$#" -ne 1 || "$1" != "light" && "$1" != "dark" ]]; then
  echo "Usage: $0 light/dark"
  exit 1
fi

theme=$1

perl -p -i -e "s/theme\s*=\s*\"(dark|light)\"/theme = \"${theme}\"/" ~/.config/chezmoi/chezmoi.toml

# Apply `chezmoi` config file
chezmoi apply

# Reload processes

# i3
cmd_exists i3-msg && i3-msg reload

# i3status-rs
# https://github.com/greshake/i3status-rust/pull/1131
cmd_exists i3status-rs && killall -USR2 i3status-rs

# Powerline
cmd_exists powerline-daemon && powerline-daemon --replace \
  && cmd_exists tmux && tmux source "$HOME/.config/powerline/bindings/tmux/powerline.conf"

# Emacs
emacs_server_socket_dir_globs=("$HOME/local/run/emacs/*")
if cmd_exists emacsclient; then
  for path in ${emacs_server_socket_dir_globs[@]}; do
    emacsclient -s $path -eun '(load "~/.config/scripts/emacs/load-theme.el")'
  done
fi
