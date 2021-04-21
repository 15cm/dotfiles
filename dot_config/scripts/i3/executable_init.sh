#!/bin/zsh

sleep 5

launch_if_not_exist () {
  ps cax | grep -q $1 || eval "$2 &"
}

launch_app_if_not_exist () {
  launch_if_not_exist $1 "dex $2"
}

# Autostart applications
launch_app_if_not_exist copyq /usr/share/applications/com.github.hluk.copyq.desktop
launch_app_if_not_exist goldendict /usr/share/applications/goldendict.desktop
launch_app_if_not_exist keepassxc /usr/share/applications/org.keepassxc.KeePassXC.desktop
launch_app_if_not_exist syncthing-gtk /usr/share/applications/syncthing-gtk.desktop
launch_app_if_not_exist anki /usr/share/applications/anki.desktop
launch_app_if_not_exist redshift-gtk /usr/share/applications/redshift-gtk.desktop
launch_if_not_exist fcitx5 fcitx5

# Essentials
autorandr -l default &

# Starting things with i3
systemctl --user start xsession.target &

# X11
xset r rate 350 22
xset s off
