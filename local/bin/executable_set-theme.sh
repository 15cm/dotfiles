#!/bin/bash

cmd_exists () {
  command -v $1 > /dev/null
}

if  [[ "$#" -ne 1 || "$1" != "light" && "$1" != "dark" ]]; then
  echo "Usage: $0 light/dark"
  exit 1
fi

emacs_server_dir="/tmp/emacs$UID"

theme=$1

if [ $theme = "light" ]; then
  perl -p -i -e 's/theme\s*=\s*"(dark|light)"/theme = "light"/' ~/.config/chezmoi/chezmoi.toml
  cmd_exists guake && guake --change-palette 'Solarized Light'
else
  perl -p -i -e 's/theme\s*=\s*"(dark|light)"/theme = "dark"/' ~/.config/chezmoi/chezmoi.toml
  cmd_exists guake && guake --change-palette 'Tomorrow Night'
fi

# Apply `chezmoi` config file
chezmoi apply

# Reload

# i3
# Reload i3bar
cmd_exists i3-msg && i3-msg reload &

# Restart i3status
killall i3bar && i3bar --bar_id=bar-1 2>&1 > /dev/null 2>&1 &

# Powerline
cmd_exists powerline-daemon && powerline-daemon --replace \
  && cmd_exists tmux && tmux source "$HOME/.config/powerline/bindings/tmux/powerline.conf" &

# Emacs
if cmd_exists emacsclient; then
  for p in ${emacs_server_dir}/*; do
    f=$(basename $p)
    emacsclient -s $f -eun '(load "~/.config/scripts/emacs/load-theme.el")'
  done
fi
