#!/bin/zsh

sleep 5

launch_if_not_exist () {
  ps cax | grep -q $1 || eval "$2 &"
}

launch_app_if_not_exist () {
  launch_if_not_exist $1 "dex /usr/share/applications/$1.desktop"
}

auto_start_on_boots=(
  copyq
  goldendict
  keepassxc
  syncthing-gtk
  anki
  redshift-gtk
)

# Autostart applications
for app in ${auto_start_on_boots}; do
  launch_app_if_not_exist $app
done
launch_if_not_exist fcitx5 fcitx5

# Essentials
autorandr -l default &

# Starting things with i3
systemctl --user start xsession.target &

# X11
xset r rate 350 22
xset s off
