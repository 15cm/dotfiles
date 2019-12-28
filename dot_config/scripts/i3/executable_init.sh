#!/bin/bash

# Keyboard settings: repeat_delay repeat_rate
xset r rate 400 24

# Autostart applications
copyq &
guake &
goldendict &
keepassxc &
syncthing-gtk &

# Applet
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
blueman-applet &
xfce4-power-manager &
pamac-tray &
redshift-gtk &
pasystray &

# Essentials
pulseaudio -k; exec --no-startup-id pulseaudio --start -D
fcitx &
xautolock -time 300 -locker blurlock &
autorandr -l default &

# Starting things with i3
systemctl --user start xsession.target &
